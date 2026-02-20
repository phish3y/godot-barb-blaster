extends Node3D
class_name Turret

@export var projectile: PackedScene
@export var turret_range: float = 10.0

@onready var barrel: MeshInstance3D = $TurretBase/TurretTop/Visor/Barrel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var enemy: Enemy
var enemy_path: Path3D

func _physics_process(delta: float) -> void:
	enemy = find_best_target()
	if enemy:
		self.look_at(enemy.global_position, Vector3.UP, true)
	
func _on_timer_timeout() -> void:
	if enemy:
		animation_player.play("turret_fire")
		var shot: Projectile = self.projectile.instantiate() as Projectile
		add_child(shot)
		shot.global_position = self.barrel.global_position
		shot.direction = self.global_transform.basis.z

func find_best_target() -> Enemy:
	var best_target: Enemy = null
	var best_progress: int = 0
	for child in self.enemy_path.get_children():
		if child is Enemy:
			if child.progress > best_progress && self.global_position.distance_to(child.global_position) <= turret_range:
				best_progress = child.progress
				best_target = child
	
	return best_target
