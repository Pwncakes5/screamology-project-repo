extends Interactable3D
class_name Test_Key

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func interact():
	super()
	queue_free()
