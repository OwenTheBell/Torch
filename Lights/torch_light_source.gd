class_name TorchLightSource extends PointLight2D

signal on_ignited
signal on_extinguish

@export var start_lit: bool = false
@export var decay: bool = true
@export var duration: float = 100
@export_range(0.0, 1.0) var minimum_light: float = 1.0
@export_range(0.0, 1.0) var minimum_radius: float = 1.0

var _remaining_time
var _is_lit = false
var _starting_scale
var _starting_energy

func _ready():
  _remaining_time = duration
  _starting_scale = scale
  _starting_energy = energy
  if start_lit:
    ignite()
  else:
    extinguish()

    
func on_tick(delta):
  if not _is_lit:
    return
  _remaining_time -= delta
  update_light()


func ignite():
  _is_lit = true
  update_light()
  get_parent().add_to_group("burning")
  add_to_group("illuminated light source")
  on_ignited.emit()


func extinguish():
  _is_lit = false
  energy = 0
  scale = Vector2.ZERO
  get_parent().remove_from_group("burning")
  remove_from_group("illuminated light source")
  on_extinguish.emit()


func update_light():
  var percent_radius = (1 - minimum_radius) * (_remaining_time / duration) + minimum_radius
  scale = _starting_scale * percent_radius
  var percent_energy = (1 - minimum_light) * (_remaining_time / duration) + minimum_light
  energy = _starting_energy * percent_energy