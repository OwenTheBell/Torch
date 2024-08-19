class_name MembersInGroupTransition
extends EnemyStateTransition

@export var group: String
enum ComparisonType {GreaterThan, Equal, LessThan}
@export var comparison: ComparisonType
@export var num: int


func check(delta):
  var count = get_tree().get_nodes_in_group(group).size()
  if comparison == ComparisonType.GreaterThan:
    return count > num
  elif comparison == ComparisonType.Equal:
    return count == num
  if comparison == ComparisonType.LessThan:
    return count < num