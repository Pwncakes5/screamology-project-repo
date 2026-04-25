class_name Interactable3D extends Area3D

@export var prompt: String = "Interact"
signal interacted_with

func _init() -> void:
	monitoring = false

func interact() -> void:
	print("Interacted with")
	interacted_with.emit()
