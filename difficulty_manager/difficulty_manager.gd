extends Node
class_name DifficultManager

signal stop_spawning_enemies

@export var game_length: float = 30.0
@export var spawn_time_curve: Curve
@export var enemy_health_curve: Curve

@onready var timer: Timer = $Timer

func _ready() -> void:
	self.timer.start(game_length)

func game_progress_ratio() -> float:
	return 1.0 - self.timer.time_left / self.game_length

func get_spawn_time() -> float:
	return self.spawn_time_curve.sample(self.game_progress_ratio())

func get_enemy_health() -> float:
	return self.enemy_health_curve.sample(self.game_progress_ratio())

func _on_timer_timeout() -> void:
	self.stop_spawning_enemies.emit()
