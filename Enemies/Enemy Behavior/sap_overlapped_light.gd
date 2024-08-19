class_name SapOverlappedLight
extends Node

@export var sap_per_second: int

var _overlapped_lights: Array[TorchLightSource]

# Called when the node enters the scene tree for the first time.
func _ready():
  var area = get_parent() as Area2D
  area.body_entered.connect(_on_enter)
  area.body_exited.connect(_on_exit)


func _exit_tree():
  var area = get_parent() as Area2D
  area.body_entered.disconnect(_on_enter)
  area.body_exited.disconnect(_on_exit)


func _on_enter(node: Node2D) -> void:
  var lights = node.find_children("", "TorchLightSource") as Array[TorchLightSource]
  for light in lights:
    if light.is_lit:
      _overlapped_lights.append(light as TorchLightSource)


func _on_exit(node: Node2D) -> void:
  var lights = node.find_children("", "TorchLightSource") as Array[TorchLightSource]
  for light in lights:
    _overlapped_lights.erase(light)


func on_tick(delta):
  var sap = sap_per_second * delta
  for light in _overlapped_lights:
    light.reduce_time_by(sap)