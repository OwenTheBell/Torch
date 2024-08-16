class_name EnterExitTransition extends EnemyStateTransition

@export var collision_index: int
@export var entered: bool
@export var raycasted: bool
@export_flags_2d_physics var ray_mask: int

var _area: Area2D

func setup(owner):
	_area = owner.get_node("Area2D")


func check(delta):
	var count = 0
	for overlapping_area in _area.get_overlapping_areas():
		if overlapping_area.get_collision_layer_value(collision_index):
			if raycasted and _raycast_to_node(overlapping_area):
				count += 1
			elif not raycasted:
				count += 1
	return (entered && count > 0) || (not entered && count == 0)


func _raycast_to_node(target: Node2D):
	var query = PhysicsRayQueryParameters2D.create(
      enemy.global_position,
      target.global_position,
      ray_mask,
      [self, target])
	var space_state = enemy.get_world_2d().direct_space_state
	var result = space_state.intersect_ray(query)
	if not result or target.is_ancestor_of(result.collider):
		return true
	return false