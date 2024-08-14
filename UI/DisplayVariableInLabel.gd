class_name DisplayVariableInLabel extends Node

@export var label: Label
@export var variable: VariableResource


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  label.text = variable.get_string_value()
