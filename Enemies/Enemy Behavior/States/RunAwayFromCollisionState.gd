class_name RunAwayFromCollisionState extends EnemyState

@export var collision_layer: int
@export var speed: float

var _target: Node2D
var _area: Area2D
var _scary_collisions: Array[Node2D]

func _setup():
  _area = enemy.get_node("Area2D")
  _area.area_entered.connect(area_entered)
  _area.area_exited.connect(area_exited)


func _can_enter():
  for overlapping_area in _area.get_overlapping_areas():
    if overlapping_area.get_collision_layer_value(collision_layer):
      _target = overlapping_area.get_parent()
      return true
  return false


func _enter():
  pass


func _exit():
  pass
  
  
func _update_state(delta):
  if not is_instance_valid(_target):
    _target = player
  var direction = Vector2.ZERO
  if _scary_collisions.size() > 0:
    for node in _scary_collisions:
      direction += (enemy.global_position - node.global_position).normalized()
    direction /= _scary_collisions.size()
  else:
    direction = (enemy.global_position - player.global_position).normalized()
  enemy.velocity = direction * speed
  enemy.move_and_slide()
  enemy.look_at(enemy.global_position + direction * 5)


func area_entered(area):
  if area.get_collision_layer_value(collision_layer):
    _scary_collisions.append(area)

func area_exited(area):
  if area.get_collision_layer_value(collision_layer):
    var index = _scary_collisions.find(area)
    if index >= 0:
      _scary_collisions.remove_at(index)
