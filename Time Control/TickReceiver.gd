class_name TickReceiver extends Node


func _enter_tree():
	connect_to_tick()


func _exit_tree():
	disconnect_from_tick()


func connect_to_tick():
	TickControl.tick.connect(receive_tick)


func disconnect_from_tick():
	TickControl.tick.disconnect(receive_tick)


func receive_tick(delta):
	get_parent().propagate_call("on_tick", [delta])
