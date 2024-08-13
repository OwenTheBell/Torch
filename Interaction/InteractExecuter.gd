class_name InteractExecuter extends Node

@export var hold_time: float

var receivers: Array[InteractReceiver]
var elapsed_hold: float = 0

func _process(delta):
  if Input.is_action_pressed("Interact") and receivers.size() > 0:
    elapsed_hold += delta
    if elapsed_hold >= hold_time:
      receivers[receivers.size() - 1].on_interact.emit()
      elapsed_hold = 0


func _on_body_entered(body):
  if body.has_node("InteractReceiver"):
    receivers.append(body.get_node("InteractReceiver") as InteractReceiver)


func _on_body_exited(body):
  if body.has_node("InteractReceiver"):
    var node = body.get_node("InteractReceiver") as InteractReceiver
    var index = receivers.find(node)
    if index >= 0:
      receivers.remove_at(index)
