extends Node3D
class_name Base

@export var max_health: int = 5
var current_health: int:
	set(health):
		current_health = health
		self.label_3d.modulate = Color.RED.lerp(Color.WHITE, float(current_health) / float(self.max_health))
		self.label_3d.text = str(current_health) + "/" + str(self.max_health)
		if current_health < 1:
			get_tree().reload_current_scene()
	get:
		return current_health

@onready var label_3d: Label3D = $Label3D

func _ready() -> void:
	self.current_health = max_health
	
func take_damage() -> void:
	self.current_health -= 1
