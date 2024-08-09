class_name TickReceiver extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	TickControl.tick.connect(receive_tick)


func _exit_tree():
	TickControl.tick.disconnect(receive_tick)


func receive_tick(delta):
	get_parent().propagate_call("on_tick", [delta])
