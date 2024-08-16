class_name DistanceFromGroupTransition extends EnemyStateTransition

@export var group: String
@export var closest_only: bool
enum ComparisionType {FurtherThan, CloserThan}
@export var comparision: ComparisionType
@export var distance: float
@export var raycasted: bool
@export_flags_2d_physics var ray_mask: int

var _members: Array[Node]

func check(delta):
  _members = get_tree().get_nodes_in_group(group)
  if _members.size() == 0:
    return false
  if comparision == ComparisionType.FurtherThan:
    return distance < get_distance()
  elif comparision == ComparisionType.CloserThan:
    return distance > get_distance()
  return false


func get_distance():
  if closest_only:
    var shortest_dist = 1000000000
    for member in _members:
      if raycasted and not _raycast_to_node(member):
        continue
      var position = (member as Node2D).global_position
      var dis = position.distance_squared_to(enemy.global_position)
      if dis < shortest_dist:
        shortest_dist = dis
    return sqrt(shortest_dist)
  else:
    var target_position = Vector2.ZERO
    for member in _members:
      if raycasted and not _raycast_to_node(member):
        continue
      target_position += (member as Node2D).global_position
      target_position /= _members.size()
    return target_position.distance_to(enemy.global_position)


# trace to see if there is anything between us and the target
func _raycast_to_node(target: Node2D):
  var query = PhysicsRayQueryParameters2D.create(
      enemy.global_position,
      target.global_position,
      ray_mask,
      [self, target])
  var space_state = enemy.get_world_2d().direct_space_state
  var result = space_state.intersect_ray(query)
  if not result or target.is_ancestor_of(result.collider):
    return true
  return false