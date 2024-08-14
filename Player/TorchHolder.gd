class_name TorchHolder extends Node2D

@export var default_light: PointLight2D

var held_torch: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
  get_parent().get_node("InteractExecuter").add_receiver(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass


func interact():
  var torch = Inventory.get_next_node()
  if is_instance_valid(torch):
    torch.get_parent().remove_child(torch)
    add_child(torch)
    torch.position = Vector2.ZERO
    torch.propagate_call("ignite")
    held_torch = torch
  else:
    print("inventory is empty")
