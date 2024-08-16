class_name EnemyStateTransition extends Node

@export var ToState: EnemyState

var enemy: CharacterBody2D

func _ready():
	pass


func _process(delta):
	pass


func setup(enemy: CharacterBody2D):
	self.enemy = enemy

# check to see if the transition should happen
func check(delta):
	return false

# call to cleanup everything and get ready for the next state
func reset():
	pass
