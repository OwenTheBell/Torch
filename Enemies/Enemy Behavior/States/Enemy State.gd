class_name EnemyState extends Node

var enemy: CharacterBody2D
var player: CharacterBody2D
var transitions: Array[EnemyStateTransition]

func _ready():
  pass

func base_setup():
  for child in find_children("", "EnemyStateTransition"):
    var transition = child as EnemyStateTransition
    transition.setup(enemy)
    transitions.append(transition)
  _setup()


func _setup():
  pass


func can_enter():
  return false


func _enter():
  pass


func _exit():
  pass


func _update_state(delta):
  pass


func _physics_update_state(delta):
  pass
