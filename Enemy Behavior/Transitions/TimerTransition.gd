class_name TimerTransition extends EnemyStateTransition

@export var duration : float

var time_remaining


func setup(owner):
	time_remaining = duration


func reset():
	time_remaining = duration


func check(delta):
	time_remaining -= delta
	return time_remaining <= 0
