extends Node

@export var game_over_canvas : CanvasLayer

var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over_canvas.visible = false
	Dispatcher.game_over.connect(_received_game_over)


func _process(delta):
	if Input.is_action_just_pressed("restart") && game_over:
		get_tree().paused = false
		get_tree().reload_current_scene()


func _received_game_over():
	game_over_canvas.visible = true
	game_over = true
	get_tree().paused = true
