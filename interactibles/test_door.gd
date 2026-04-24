class_name TESTDoor extends Interactible3D


@onready var _static_body_collision_shape: CollisionShape3D = %StaticBodyCollisionShape3D
@onready var _door_mesh: MeshInstance3D = $MeshInstance3D

var _tween_door : Tween = null

var is_active := false:
	set = set_is_active

func interact() -> void:
	super()
	set_is_active(not is_active)



func set_is_active(new_value: bool) -> void:
	is_active = new_value
	_static_body_collision_shape.disabled = is_active
