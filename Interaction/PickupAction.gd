class_name PickupAction extends Node

signal on_pickup

func on_interact():
  on_pickup.emit()
  Inventory.pickup(get_parent())