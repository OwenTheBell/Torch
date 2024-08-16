class_name SignalOnCollision
extends Node

signal on_collision

@export var with_group: String


# Called when the node enters the scene tree for the first time.
func _enter_tree():
  var area = get_parent() as Area2D
  area.area_entered.connect(_on_area_entered)
  area.body_entered.connect(_on_body_entered)


func _on_area_entered(area: Area2D):
  _try_signal(area.owner)


func _on_body_entered(body: Node2D):
  _try_signal(body)


func _try_signal(node: Node):
  if with_group != "" and node.is_in_group(with_group):
    on_collision.emit()
