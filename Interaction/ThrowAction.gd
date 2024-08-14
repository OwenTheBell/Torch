class_name ThrowAction extends Node

signal on_throw

@export var speed = 1000


func throw():
  var parent = get_parent()
  var world = get_tree().root.get_node("World")
  parent.reparent(world)
  parent.apply_impulse(Vector2(speed, 0).rotated(parent.rotation), Vector2())
  on_throw.emit()