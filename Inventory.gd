extends Node

var held_nodes: Array[Node2D]

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass


func pickup(node: Node2D):
  held_nodes.append(node)
  print("picked up " + node.name)


func get_next_node(node: Node2D):
  if held_nodes.size() > 0:
    node = held_nodes[0]
    held_nodes.remove_at(0)
    return true
  else:
    return false