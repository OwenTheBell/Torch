class_name SetVisibilityFromBool extends Node

@export var bool_var: BoolVariable

func _process(delta):
  (get_parent() as CanvasItem).visible = bool_var.value