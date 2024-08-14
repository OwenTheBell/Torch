class_name InteractReceiver extends Node

signal on_interact

@export var interact_description: String

func interact():
  on_interact.emit()