extends Node

@export var enemy_types : Array[Resource]
@export var initial_spawn_time : float
@export var scale_spawn_by : float

@onready var spawn_timer = $Timer

var spawnPoints : Array[Node2D]
var spawn_gap
var time_until_spawn
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Node2D:
			spawnPoints.append(child)
	spawn_gap = initial_spawn_time
	time_until_spawn = initial_spawn_time
	player = get_parent().get_node("Player");

func _physics_process(delta):
	time_until_spawn -= delta
	if time_until_spawn <= 0:
		spawn_gap ++ scale_spawn_by
		time_until_spawn = spawn_gap
		for point in spawnPoints:
			if point.global_position.distance_to(player.global_position) < 1500:
				continue
			var enemy_instance = enemy_types.pick_random().instantiate()
			enemy_instance.global_position = point.global_position
			get_parent().call_deferred("add_child", enemy_instance)
