extends Node3D

@export var north_face_color: Color = Color("ff0000")
@export var south_face_color: Color = Color("ff8b28")
@export var east_face_color: Color = Color("ffffff")
@export var west_face_color: Color = Color("ffff00")
@export var front_face_color: Color = Color("0000ff")
@export var back_face_color: Color = Color("00ff00")

var default_color: Color = Color("2a2a2a")

@onready var cube_piece_1 = %CubePiece1
@onready var cube_piece_2 = %CubePiece2
@onready var cube_piece_3 = %CubePiece3
@onready var cube_piece_4 = %CubePiece4
@onready var cube_piece_5 = %CubePiece5
@onready var cube_piece_6 = %CubePiece6
@onready var cube_piece_7 = %CubePiece7
@onready var cube_piece_8 = %CubePiece8
@onready var cube_piece_9 = %CubePiece9
@onready var cube_piece_10 = %CubePiece10
@onready var cube_piece_11 = %CubePiece11
@onready var cube_piece_12 = %CubePiece12
@onready var cube_piece_13 = %CubePiece13
@onready var cube_piece_14 = %CubePiece14
@onready var cube_piece_15 = %CubePiece15
@onready var cube_piece_16 = %CubePiece16
@onready var cube_piece_17 = %CubePiece17
@onready var cube_piece_18 = %CubePiece18
@onready var cube_piece_19 = %CubePiece19
@onready var cube_piece_20 = %CubePiece20
@onready var cube_piece_21 = %CubePiece21
@onready var cube_piece_22 = %CubePiece22
@onready var cube_piece_23 = %CubePiece23
@onready var cube_piece_24 = %CubePiece24
@onready var cube_piece_25 = %CubePiece25
@onready var cube_piece_26 = %CubePiece26
@onready var cube_piece_27 = %CubePiece27

@onready var pivot_1 = $Pivot1
@onready var pivot_2 = $Pivot2
@onready var pivot_3 = $Pivot3
@onready var pivot_4 = $Pivot4

@onready var collider_x = $Collider_X
@onready var collider_y = $Collider_Y
@onready var collider_z = $Collider_Z

@onready var face_rotation = { 'enabled': false, 'direction': 1, 'axis': 'y' }
@onready var face_rotation_counter = 0

@onready var face_pivots = []

func _ready():
	_set_piece_color(cube_piece_1,north_face_color,default_color,default_color)
	_set_piece_color(cube_piece_2,north_face_color,front_face_color,default_color)
	_set_piece_color(cube_piece_3,north_face_color,back_face_color,default_color)
	_set_piece_color(cube_piece_4,north_face_color,east_face_color,default_color)
	_set_piece_color(cube_piece_5,north_face_color,front_face_color,east_face_color)
	_set_piece_color(cube_piece_6,north_face_color,east_face_color,back_face_color)
	_set_piece_color(cube_piece_7,north_face_color,west_face_color,default_color)
	_set_piece_color(cube_piece_8,north_face_color,west_face_color,front_face_color)
	_set_piece_color(cube_piece_9,north_face_color,back_face_color,west_face_color)

	_set_piece_color(cube_piece_10,default_color,default_color,default_color)
	_set_piece_color(cube_piece_11,default_color,front_face_color,default_color)
	_set_piece_color(cube_piece_12,default_color,back_face_color,default_color)
	_set_piece_color(cube_piece_13,default_color,east_face_color,default_color)
	_set_piece_color(cube_piece_14,default_color,front_face_color,east_face_color)
	_set_piece_color(cube_piece_15,default_color,east_face_color,back_face_color)
	_set_piece_color(cube_piece_16,default_color,west_face_color,default_color)
	_set_piece_color(cube_piece_17,default_color,west_face_color,front_face_color)
	_set_piece_color(cube_piece_18,default_color,back_face_color,west_face_color)

	_set_piece_color(cube_piece_19,south_face_color,default_color,default_color)
	_set_piece_color(cube_piece_20,south_face_color,front_face_color,default_color)
	_set_piece_color(cube_piece_21,south_face_color,back_face_color,default_color)
	_set_piece_color(cube_piece_22,south_face_color,east_face_color,default_color)
	_set_piece_color(cube_piece_23,south_face_color,east_face_color,front_face_color)
	_set_piece_color(cube_piece_24,south_face_color,back_face_color,east_face_color)
	_set_piece_color(cube_piece_25,south_face_color,west_face_color,default_color)
	_set_piece_color(cube_piece_26,south_face_color,front_face_color,west_face_color)
	_set_piece_color(cube_piece_27,south_face_color,west_face_color,back_face_color)

func _process(delta):
	if face_rotation['enabled']:
		_face_rotation_state(delta)
		return
	
	if Input.is_action_just_pressed("rotate_north_face"):
		start_rotation('N')
		return
	
	if Input.is_action_just_pressed("rotate_south_face"):
		start_rotation('S')
		return
	
	if Input.is_action_just_pressed("rotate_east_face"):
		start_rotation('E')
		return
	
	if Input.is_action_just_pressed("rotate_west_face"):
		start_rotation('W')
		return
	
	if Input.is_action_just_pressed("rotate_front_face"):
		start_rotation('F')
		return
	
	if Input.is_action_just_pressed("rotate_back_face"):
		start_rotation('B')
		return

func start_rotation(face, direction = 1):
	face_rotation['direction'] = direction
	face_rotation['axis'] = _face_to_axis(face)
	
	var collider = _axis_to_collider(face_rotation['axis'])
	
	if(collider != null):
		collider.position = _face_to_position(face)
	else:
		face_rotation['enabled'] = false

func _face_to_axis(face):
	match face:
		'N':
			return 'y'
		'S':
			return 'y'
		'E':
			return 'x'
		'W':
			return 'x'
		'F':
			return 'z'
		'B':
			return 'z'
		_:
			return ''

func _face_to_position(face):
	match face:
		'N':
			return Vector3(0,1,0)
		'S':
			return Vector3(0,-1,0)
		'E':
			return Vector3(1,0,0)
		'W':
			return Vector3(-1,0,0)
		'F':
			return Vector3(0,0,1)
		'B':
			return Vector3(0,0,-1)
		_:
			return Vector3(0,0,0)

func _axis_to_collider(axis):
	match axis:
		'x':
			return collider_x
		'y':
			return collider_y
		'z':
			return collider_z
		_:
			return null
		

func _face_rotation_state(delta):
	var angle_step = 1 * face_rotation['direction']
	var rad_angle_step = deg_to_rad(angle_step)
	
	if face_pivots.size() < 9:
		return
		
	var counter_condition = false
		
	if(face_rotation['direction'] > 0):
		counter_condition = face_rotation_counter < 90
	else:
		counter_condition = face_rotation_counter > -90
	
	if(counter_condition):
		for pivot in face_pivots:
			if(face_rotation['axis'] == 'x'):
				pivot.rotate_x(rad_angle_step)
			if(face_rotation['axis'] == 'y'):
				pivot.rotate_y(rad_angle_step)
			if(face_rotation['axis'] == 'z'):
				pivot.rotate_z(rad_angle_step)
		face_rotation_counter += angle_step
	else:
		face_rotation['enabled'] = false
		face_rotation_counter = 0
		face_pivots = []
	
	

func _set_piece_color(cube_piece, color1, color2, color3):
	cube_piece.blue_face_color = color1
	cube_piece.red_face_color = color2
	cube_piece.green_face_color = color3
	cube_piece.paint_faces()

func _on_collider_y_area_entered(area):
	face_pivots.append(area.get_parent())
	
	if face_pivots.size() >= 9:
		collider_x.position = Vector3(0,100,0)
		collider_y.position = Vector3(0,100,0)
		collider_z.position = Vector3(0,100,0)
		face_rotation['enabled'] = true

	
