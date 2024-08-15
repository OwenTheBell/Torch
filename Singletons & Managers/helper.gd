extends Node

func get_scene_root(node: Node) -> Node:
  var owner = node.owner;
  if owner.name == "World":
    return node
  return owner