extends Area3D
class_name Projectile

@export var speed: float = 30.0

var direction: Vector3 = Vector3.FORWARD

func _physics_process(delta: float) -> void:
	self.position += direction * speed * delta


func _on_timer_timeout() -> void:
	self.queue_free()

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		var enemy: Enemy = area.get_parent() as Enemy
		enemy.current_health -= 25 # this should call something like take_damage() and have the Enemy manage its own state
		self.queue_free()
