class_name SendTickOnMove extends Node


var rigid_owner : RigidBody2D
var character_owner : CharacterBody2D

func _ready():
	var parent = get_parent()
	if parent is RigidBody2D:
		rigid_owner = parent as RigidBody2D
	elif parent is CharacterBody2D:
		character_owner = parent as CharacterBody2D
	else:
		print ("SendTickOnMove attached to " + parent.name + " which lacks a velocity")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(rigid_owner):
		if rigid_owner.linear_velocity.length() > 0:
			TickControl.send_tick()
	elif is_instance_valid(character_owner):
		if character_owner.velocity.length() > 0:
			TickControl.send_tick()
