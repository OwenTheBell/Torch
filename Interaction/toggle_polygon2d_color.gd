class_name TogglePolygon2DColor
extends Node

@export var color: Color
@export var polygon: Polygon2D

var _base_color: Color


func _ready():
  _base_color = polygon.color


func show_alt_color():
  polygon.color = color


func show_base_color():
  if is_instance_valid(_base_color):
    polygon.color = _base_color