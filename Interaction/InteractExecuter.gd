class_name InteractExecuter extends Node

@export var hold_time: float
@export var tick_on_hold: bool
@export var description_var: StringVariable
@export var percent_var: FloatVariable

var receivers: Array[Node]
var elapsed_hold: float = 0

var executing = false

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
  percent_var.value = elapsed_hold / hold_time


func _on_body_entered(body):
  var node = body.find_child("InteractReceiver")
  if is_instance_valid(node):
    add_receiver(node, true)


func _on_body_exited(body):
  var node = body.find_child("InteractReceiver")
  if is_instance_valid(node):
    remove_receiver(node)


func add_receiver(receiver: Node, priority = false):
  if receivers.find(receiver) >= 0:
    return
  if priority:
    receivers.append(receiver)
  else:
    receivers.insert(0, receiver)
  update_description()


func remove_receiver(receiver: Node):
  var index = receivers.find(receiver)
  if index >= 0:
    receivers.remove_at(index)
  update_description()


func update_description():
  if receivers.size() > 0:
    description_var.value = receivers[receivers.size() - 1].interact_description
  else:
    description_var.value = ""