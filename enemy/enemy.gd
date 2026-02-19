extends PathFollow3D

@export var speed: float = 5.0

@onready var base: Base = get_tree().get_first_node_in_group("base")

func _process(delta: float) -> void:
	self.progress += delta * speed
	if self.progress_ratio == 1.0:
		self.base.take_damage()
		self.set_process(false)
