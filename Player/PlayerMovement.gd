extends CharacterBody2D


@export var SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

  # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var direction = Vector2.ZERO
  if Input.is_action_pressed("Up"):
    direction.y -= 1
  if Input.is_action_pressed("Down"):
    direction.y += 1
  if Input.is_action_pressed("Left"):
    direction.x -= 1
  if Input.is_action_pressed("Right"):
    direction.x += 1
  #if direction:
    #velocity.x = direction * SPEED
  #else:
    #velocity.x = move_toward(velocity.x, 0, SPEED)
  
  direction = direction.normalized()
  velocity = direction * SPEED;

  move_and_slide()

  look_at(get_global_mouse_position())

