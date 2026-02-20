extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultManager

@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var new_enemy: Enemy = self.enemy_scene.instantiate()
	new_enemy.max_health = self.difficulty_manager.get_enemy_health()
	self.add_child(new_enemy)
	self.timer.wait_time = self.difficulty_manager.get_spawn_time()
	
func _on_timer_timeout() -> void:
	self.spawn_enemy()
