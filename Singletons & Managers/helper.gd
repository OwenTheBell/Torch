extends Node

# Return the root of the scene that owns this node. Excluding World
# Necessary for getting the parent of scenes that have been placed directly
# into World
func get_scene_root(node: Node) -> Node:
  var node_owner = node.owner;
  if node_owner.name == "World":
    return node
  return node_owner