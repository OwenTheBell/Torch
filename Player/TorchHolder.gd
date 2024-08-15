class_name TorchHolder extends Node2D

@export var default_light: PointLight2D

@export var interact_description: String

var held_torch: Node2D
var executer: InteractExecutor


# Called when the node enters the scene tree for the first time.
func _ready():
  executer = get_parent().get_node("InteractExecutor") as InteractExecutor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if Inventory.held_nodes.size() == 0:
    executer.remove_receiver(self)
  else:
    executer.add_receiver(self, false)
  
  if not is_instance_valid(held_torch):
    return
  if Input.is_action_just_pressed("PrimaryAction"):
    held_torch.propagate_call("receive_input", ["PrimaryAction"])
  elif Input.is_action_just_pressed("SecondaryAction"):
    held_torch.propagate_call("receive_input", ["SecondaryAction"])


func interact():
  var torch = Inventory.get_next_node()
  if is_instance_valid(torch):
    torch.reparent(self)
    torch.position = Vector2.ZERO
    torch.rotation = 0
    torch.propagate_call("ignite")
    held_torch = torch
  else:
    print("inventory is empty")
