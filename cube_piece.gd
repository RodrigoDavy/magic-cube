extends Node3D

@export var blue_face_color: Color = Color("0000ff")
@export var red_face_color: Color = Color("ff0000")
@export var green_face_color: Color = Color("00ff00")

@onready var top_face_mesh = $TopFaceMesh
@onready var front_face_mesh = $FrontFaceMesh
@onready var side_face_mesh = $SideFaceMesh

func _ready():
	paint_faces()

func _process(delta):
	pass

func paint_faces():
	set_material_color(top_face_mesh, blue_face_color)
	set_material_color(front_face_mesh, red_face_color)
	set_material_color(side_face_mesh, green_face_color)

func set_material_color(mesh_instance, color):
	var new_material = StandardMaterial3D.new()
	new_material.albedo_color = color
	mesh_instance.set_surface_override_material(0, new_material)
