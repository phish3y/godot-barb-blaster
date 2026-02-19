extends PathFollow3D
class_name Enemy

@export var max_health: int = 50
@export var speed: float = 5.0

@onready var base: Base = get_tree().get_first_node_in_group("base")

var current_health: int:
	set(health):
		current_health = health
		if current_health < 1:
			self.queue_free()

func _ready() -> void:
	current_health = max_health
	
func _process(delta: float) -> void:
	self.progress += delta * speed
	
	if self.progress_ratio == 1.0:
		self.base.take_damage()
		self.set_process(false)
	
