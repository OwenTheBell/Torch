class_name EnemyStateControl extends Node

var states: Array[EnemyState]

var activeState: EnemyState
var enemy: CharacterBody2D
var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
  enemy = get_parent() as CharacterBody2D
  player = get_node("/root/World/Player") as CharacterBody2D
  for child in find_children("", "EnemyState"):
    var state = child as EnemyState
    state.enemy = enemy
    state.player = player
    state.base_setup()
    states.append(state)
  activeState = states[0]


func on_tick(delta):
  activeState.process(delta)
  for transition in activeState.transitions:
    if transition.check(delta):
      change_state(activeState, transition.ToState)
      break

func change_state(from: EnemyState, to: EnemyState):
  from.exit()
  for transition in from.transitions:
    transition.reset()
  to.enter()
  activeState = to
