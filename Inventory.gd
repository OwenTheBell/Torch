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
  node.visible = false
  node.process_mode = Node.PROCESS_MODE_DISABLED


func get_next_node():
  if held_nodes.size() > 0:
    var node = held_nodes[0]
    held_nodes.remove_at(0)
    node.visible = true
    node.process_mode = Node.PROCESS_MODE_INHERIT
    return node
  else:
    return null