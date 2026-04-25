class_name TESTDoorLocked
extends Interactable3D

@onready var _static_body_collision_shape: CollisionShape3D = %StaticBodyCollisionShape3D
@onready var _door_mesh: MeshInstance3D = $MeshInstance3D

# This property is an Interactable3D object that can be assigned to unlock the door
@export var door_key : Interactable3D = null
# This property checks if the door can be opened
@export var is_locked := true

var _tween_door : Tween = null

var is_active := false:
	set = set_is_active

# If a key has been assigned to the door_key property we connect to the key's interacted_with signal
# to unlock the door when the door is added to the scene tree
func _ready() -> void:
	if door_key != null:
		door_key.interacted_with.connect(
			func() -> void:
				is_locked = false
				prompt = "Open Door"
		)


func interact() -> void:
	super()
	if not is_locked:
		set_is_active(not is_active)



func set_is_active(new_value: bool) -> void:
	is_active = new_value
	_static_body_collision_shape.disabled = is_active
	
	
	var top_value := 2.45 if is_active else 0.5
	
	if _tween_door != null:
		_tween_door.kill()
	
	_tween_door = create_tween().set_ease(Tween.EASE_OUT)
	_tween_door.set_trans(Tween.TRANS_BACK if is_active else Tween.TRANS_BOUNCE)
	
	_tween_door.tween_property(_door_mesh, "position:y", top_value, 1.0)
