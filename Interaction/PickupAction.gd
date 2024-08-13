class_name PickupAction extends Node

func on_interact():
  Inventory.pickup(get_parent())