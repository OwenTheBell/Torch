class_name DisplayTorchesRemaining extends Node

@export var label: Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  label.text = str(Inventory.held_nodes.size())
