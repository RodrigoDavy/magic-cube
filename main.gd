extends Node3D

@onready var camera_pivot = $Cube/CameraPivot
@export var mouse_sensitivity = 0.5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		var rotation_x = -event.relative.y * mouse_sensitivity
		var rotation_y = -event.relative.x * mouse_sensitivity
		
		camera_pivot.rotate_x(deg_to_rad(rotation_x))
		camera_pivot.rotate_y(deg_to_rad(rotation_y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
