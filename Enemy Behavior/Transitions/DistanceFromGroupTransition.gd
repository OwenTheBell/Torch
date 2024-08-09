class_name DistanceFromGroupTransition extends EnemyStateTransition

@export var group: String
@export var closest_only: bool
enum ComparisionType {FurtherThan, CloserThan}
@export var comparision: ComparisionType
@export var distance: float

var members: Array[Node]

func check(delta):
  members = get_tree().get_nodes_in_group(group)
  if members.size() == 0:
    return false
  if comparision == ComparisionType.FurtherThan:
    return distance < get_distance()
  elif comparision == ComparisionType.CloserThan:
    return distance > get_distance()
  return false


func get_distance():
  if closest_only:
    var shortest_dist = 1000000000
    for member in members:
      var position = (member as Node2D).global_position
      var dis = position.distance_squared_to(get_parent().enemy.global_position)
      if dis < shortest_dist:
        shortest_dist = dis
    return sqrt(shortest_dist)
  else:
    var target_position = Vector2.ZERO
    for member in members:
      target_position += (member as Node2D).global_position
      target_position /= members.size()
    return target_position.distance_to(get_parent().enemy.global_position)
