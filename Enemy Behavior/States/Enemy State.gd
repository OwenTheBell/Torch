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
  setup()


func setup():
  pass


func can_enter():
  return false


func enter():
  pass


func exit():
  pass


func process(delta):
  pass


func physics_process(delta):
  pass
