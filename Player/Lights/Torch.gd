extends RigidBody2D

@export var decelleration : float


# Called when the node enters the scene tree for the first time.
func _ready():
  pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var counter_velocity = linear_velocity * decelleration * -1;
  apply_force(counter_velocity)


func _on_body_entered(body):
  if body is CharacterBody2D:
    if "Player" in body.name:
      for child in body.get_children():
        if child.has_method("replenish"):
          child.replenish()
      queue_free()
    else: #assume collision with an enemy and destroy it
      body.queue_free()
