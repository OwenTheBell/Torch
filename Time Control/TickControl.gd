extends Node

signal tick(delta)

var receivers : Array[TickReceiver]
var has_ticked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	has_ticked = false


func send_tick():
	if not has_ticked:
		tick.emit(get_process_delta_time())
		has_ticked = true
