class_name GameOverOnContactWithPlayer extends Node

var area : Area2D

func _ready():
	var area = get_parent().get_node("Area2D") as Area2D
	area.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D and "Player":
		Dispatcher.game_over.emit()
