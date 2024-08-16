class_name InteractExecutor extends Node

@export var hold_time: float
@export var tick_on_hold: bool
@export var has_interaction_var: BoolVariable
@export var description_var: StringVariable
@export var percent_var: FloatVariable

var receivers: Array[Node]
var elapsed_hold: float = 0

var executing = false

func _ready():
  _update_description()

func _process(delta):
  if Input.is_action_just_pressed("Interact") and not executing and receivers.size() > 0:
    executing = true
  if Input.is_action_pressed("Interact") and executing:
    elapsed_hold += delta
    if tick_on_hold:
      TickControl.send_tick()
    if elapsed_hold >= hold_time:
      receivers[receivers.size() - 1].interact()
      elapsed_hold = 0
      executing = false
  if Input.is_action_just_released("Interact"):
    executing = false
    elapsed_hold = 0
  percent_var.value = elapsed_hold / hold_time


func _on_body_entered(body):
  body.propagate_call("entered_executor", [self])


func _on_body_exited(body):
  body.propagate_call("exited_executor", [self])


func _on_area_entered(area: Area2D):
  area.get_parent().propagate_call("entered_executor", [self])


func _on_area_exited(area: Area2D):
  area.get_parent().propagate_call("exited_executor", [self])


func add_receiver(receiver: Node, priority = true):
  if receivers.find(receiver) >= 0:
    return
  if priority:
    receivers.append(receiver)
  else:
    receivers.insert(0, receiver)
  _update_description()


func remove_receiver(receiver: Node):
  var index = receivers.find(receiver)
  if index >= 0:
    receivers.remove_at(index)
  _update_description()


func _update_description():
  if receivers.size() > 0:
    description_var.value = receivers[receivers.size() - 1].interact_description
    has_interaction_var.value = true
  else:
    description_var.value = ""
    has_interaction_var.value = false
