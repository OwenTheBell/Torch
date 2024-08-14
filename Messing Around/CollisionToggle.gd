class_name CollisionToggle extends Node

@export_flags_2d_physics var layer: int
@export_flags_2d_physics var mask: int

var collision_object: CollisionObject2D

# Called when the node enters the scene tree for the first time.
func _ready():
  collision_object = get_parent() as CollisionObject2D


func toggle_on():
  var layer = collision_object.collision_layer | layer
  collision_object.collision_layer = layer
  var mask = collision_object.collision_mask | mask
  collision_object.collision_mask = mask


func toggle_off():
  var layer = collision_object.collision_layer ^ layer
  collision_object.collision_layer = layer
  var mask = collision_object.collision_mask ^ mask
  collision_object.collision_mask = mask
