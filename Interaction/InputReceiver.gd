class_name InputReceiver extends Node

signal execute

@export var input_name: String


func receive_input(name: String):
  if name == input_name:
    execute.emit()