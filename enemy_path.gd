extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultManager

@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var new_enemy: Enemy = self.enemy_scene.instantiate()
	new_enemy.max_health = self.difficulty_manager.get_enemy_health()
	self.add_child(new_enemy)
	self.timer.wait_time = self.difficulty_manager.get_spawn_time()
	new_enemy.tree_exited.connect(enemy_defeated)
	
func _on_timer_timeout() -> void:
	self.spawn_enemy()

func _on_difficulty_manager_stop_spawning_enemies() -> void:
	self.timer.stop()

func enemy_defeated() -> void:
	if self.timer.is_stopped():
		for child in self.get_children():
			if child is Enemy:
				return
		print("win")
