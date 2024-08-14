class_name HaltAction extends Node


func halt():
  var body = get_parent() as RigidBody2D
  body.linear_velocity = Vector2.ZERO
  body.angular_velocity = 0
