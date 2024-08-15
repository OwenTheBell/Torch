class_name TorchLightSource extends PointLight2D

signal on_extinguish

@export var start_lit: bool = false
@export var decay: bool = true
@export var duration: float = 100
@export_range(0.0, 1.0) var minimum_light: float = 1.0
@export_range(0.0, 1.0) var minimum_radius: float = 1.0

var remaining_time
var is_lit = false

var starting_scale
var starting_energy

func _ready():
  is_lit = true
  remaining_time = duration
  starting_scale = scale
  starting_energy = energy
  if start_lit:
    ignite()
  else:
    extinguish()
    

func on_tick(delta):
  if not is_lit:
    return
  remaining_time -= delta
  update_light()


func ignite():
  is_lit = true
  update_light()


func extinguish():
  is_lit = false
  energy = 0
  scale = Vector2.ZERO
  on_extinguish.emit()


func update_light():
  var percent_radius = (1 - minimum_radius) * (remaining_time / duration) + minimum_radius
  scale = starting_scale * percent_radius
  var percent_energy = (1 - minimum_light) * (remaining_time / duration) + minimum_light
  energy = starting_energy * percent_energy