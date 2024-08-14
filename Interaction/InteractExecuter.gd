class_name InteractExecuter extends Node

@export var hold_time: float
@export var tick_on_hold: bool

var receivers: Array[Node]
var elapsed_hold: float = 0

var executing = false

func _process(delta):
  if Input.is_action_just_pressed("Interact") and not executing and receivers.size() > 0:
    executing = true
  if Input.is_action_pressed("Interact") and executing:
    elapsed_hold += delta
    TickControl.send_tick()
    if elapsed_hold >= hold_time:
      receivers[receivers.size() - 1].interact()
      elapsed_hold = 0
      executing = false


func _on_body_entered(body):
  if body.has_node("InteractReceiver"):
    add_receiver(body.get_node("InteractReceiver"))


func _on_body_exited(body):
  if body.has_node("InteractReceiver"):
    var node = body.get_node("InteractReceiver")
    var index = receivers.find(node)
    if index >= 0:
      receivers.remove_at(index)


func add_receiver(receiver: Node):
  receivers.append(receiver)