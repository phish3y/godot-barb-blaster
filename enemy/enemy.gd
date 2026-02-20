extends PathFollow3D
class_name Enemy

@export var max_health: int = 50
@export var speed: float = 5.0
@export var gold_value: int = 15

@onready var base: Base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank: Bank = self.get_tree().get_first_node_in_group("bank")

var current_health: int:
	set(health):
		if health < current_health:
			animation_player.play("take_damage")
		current_health = health
		if current_health < 1:
			self.bank.gold += self.gold_value
			self.queue_free()

func _ready() -> void:
	current_health = max_health
	
func _process(delta: float) -> void:
	self.progress += delta * speed
	
	if self.progress_ratio == 1.0:
		self.base.take_damage()
		self.set_process(false)
		self.queue_free()
	
