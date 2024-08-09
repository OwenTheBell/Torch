extends Node

@export var speed = 1000
@export var max_ammo = 1
@export var torch: Resource
@export var held_light: Light2D
@export var mini_light: Light2D
const torch_scene = preload("res://Player/Lights/torch.tscn")

var ammo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ammo = max_ammo
	mini_light.enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("throw"):
		fire()

func fire():
	if ammo == 0:
		return
	var torch_instance = torch.instantiate()
	var parent = get_parent()
	torch_instance.global_position = parent.position
	torch_instance.rotation = parent.rotation
	torch_instance.apply_impulse(Vector2(speed, 0).rotated(parent.rotation), Vector2())
	get_node("/root/World").call_deferred("add_child", torch_instance)
	
	ammo -= 1
	if ammo <= 0:
		held_light.process_mode = Node.PROCESS_MODE_DISABLED
		held_light.enabled = false
		mini_light.enabled = true

func replenish():
	ammo += 1
	ammo = clamp(ammo, 0, max_ammo)
	held_light.process_mode = Node.PROCESS_MODE_ALWAYS
	held_light.enabled = true
	mini_light.enabled = false
