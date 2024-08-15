class_name MoveTowardsGroupState extends EnemyState

@export var group: String
@export var closest_only: bool
@export var speed: float


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_state(delta):
  var members = get_tree().get_nodes_in_group(group)
  if members.size() == 0:
    return
  var distance = 1000000000
  var target_position = Vector2.ZERO
  if closest_only:
    for member in members:
      var position = (member as Node2D).global_position
      var dis = position.distance_squared_to(enemy.global_position)
      if dis < distance:
        distance = dis
        target_position = position
  else:
    for member in members:
      target_position += (member as Node2D).global_position
      target_position /= members.size()
  var direction = (target_position - enemy.global_position).normalized()
  enemy.velocity = direction * speed
  enemy.move_and_slide()
  enemy.look_at(enemy.global_position + direction * 5)
