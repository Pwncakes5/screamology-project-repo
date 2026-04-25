class_name InteractionRayCast3D extends RayCast3D

# Collision Mask is Layer 3: Interactable objects should be on Collision Layer 3
# Will only collide with AREAS because Interactable3D extends Area3D
# Idk if this actually matters but it seems like good practice?

# Raycast Z-axis can be adjusted to change character's 'reach'. 

@onready var _interact_checker: Label = %InteractChecker

## This property stores the Interactable the player is currently looking at
var focused_interactable : Interactable3D = null

func _init() -> void:
	enabled = false # Disables raycast by default, we'll update it in the physics_process() function
	
	collide_with_areas = true # Raycast only collides with areas
	collide_with_bodies = false # Raycast will not collide with bodies

# If focused_interactiable as an object assigned and the player presses "interact",
# call the focused_interactiable's interact function
func _unhandled_input(event: InputEvent) -> void:
	if focused_interactable != null and event.is_action_pressed("interact"):
		focused_interactable.interact() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	force_raycast_update() # Force the raycast to update every frame, this gives us up-to-date collision info
	
	var collider := get_collider() as Interactable3D # Casts the collider object as an Interactable3D
	
	focused_interactable = collider # Assigns the collider to the focused_interactable variable
	
	 # Assigns the propmt text to the interact_checker label if the player is looking at an interactable
	_interact_checker.text = (
		focused_interactable.prompt if focused_interactable != null else "")
