extends Camera3D

@export var grid_map: GridMap

@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _process(delta: float) -> void:
	self.ray_cast_3d.target_position = project_local_ray_normal(
		self.get_viewport().get_mouse_position()
	) * 100.0 # length the ray can reach
	
	# ray_cast_3d.force_raycast_update()
	if self.ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)		
		if Input.is_action_just_pressed("click") && self.ray_cast_3d.get_collider() is GridMap:
				var cell = self.grid_map.local_to_map(self.ray_cast_3d.get_collision_point())
				if self.grid_map.get_cell_item(cell) == 0:
					self.grid_map.set_cell_item(cell, 1)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
