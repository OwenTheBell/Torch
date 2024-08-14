class_name RunAwayFromCollisionState extends EnemyState

@export var collision_layer: int
@export var speed: float

var target: Node2D
var area: Area2D
var scary_collisions: Array[Node2D]

func setup():
  area = enemy.get_node("Area2D")
  area.area_entered.connect(area_entered)
  area.area_exited.connect(area_exited)


func can_enter():
  for area in area.get_overlapping_areas():
    if area.get_collision_layer_value(collision_layer):
      target = area.get_parent()
      return true
  return false


func enter():
  pass


func exit():
  pass
  
  
func process(delta):
  if not is_instance_valid(target):
    target = player
  var direction = Vector2.ZERO
  if scary_collisions.size() > 0:
    for node in scary_collisions:
      direction += (enemy.global_position - node.global_position).normalized()
    direction /= scary_collisions.size()
  else:
    direction = (enemy.global_position - player.global_position).normalized()
  enemy.velocity = direction * speed
  enemy.move_and_slide()
  enemy.look_at(enemy.global_position + direction * 5)


func area_entered(area):
  if area.get_collision_layer_value(collision_layer):
    scary_collisions.append(area)

func area_exited(area):
  if area.get_collision_layer_value(collision_layer):
    var index = scary_collisions.find(area)
    if index >= 0:
      scary_collisions.remove_at(index)
