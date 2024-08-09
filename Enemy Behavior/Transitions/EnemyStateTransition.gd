class_name EnemyStateTransition extends Node

@export var ToState : EnemyState

func _ready():
	pass


func _process(delta):
	pass


func setup(owner):
	pass

# check to see if the transition should happen
func check(delta):
	return false

# call to cleanup everything and get ready for the next state
func reset():
	pass
