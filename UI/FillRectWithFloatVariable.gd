class_name FillRectWithFloatVariable extends Node

@export var rect: ColorRect
@export var variable: FloatVariable


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var scale = clamp(variable.value, 0, 1)
  rect.scale.x = scale
