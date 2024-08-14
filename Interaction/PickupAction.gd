class_name PickupAction extends Node

signal on_pickup

func on_interact():
  Inventory.pickup(get_parent())