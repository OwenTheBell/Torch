class_name EnterExitTransition extends EnemyStateTransition

@export var collision_index : int
@export var entered : bool

var area : Area2D

func setup(owner):
	area = owner.get_node("Area2D")


func check(delta):
	var count = 0
	for area in area.get_overlapping_areas():
		if area.get_collision_layer_value(collision_index):
			count += 1
	return (entered && count > 0) || (not entered && count == 0)
