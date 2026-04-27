class_name PlayerHUD extends Control



@onready var _current_task_label: RichTextLabel = %CurrentTaskLabel
@onready var _dialogue_label: RichTextLabel = %DialogueLabel

var _tween_text : Tween = null

func _ready() -> void:
	show_dialogue_text(preload("uid://m1y8gtebwv1r"), 3.0)


func show_dialogue_text(dialogue_item: DialogueItem, duration: float) -> void:
	if _tween_text != null:
		_tween_text.kill()
	
	if _dialogue_label == null:
		return
	
	_tween_text = create_tween()
	_dialogue_label.text = dialogue_item.text
	_dialogue_label.visible_ratio = 0.0
	
	_tween_text.tween_property(_dialogue_label, "visible_ratio", 1.0, duration)


func show_task_text(dialogue_item: DialogueItem, duration: float) -> void:
	if _tween_text != null:
		_tween_text.kill()
	
	if _current_task_label == null:
		return
	
	_tween_text = create_tween()
	_current_task_label.text = dialogue_item.text
	_current_task_label.visible_ratio = 0.0
	
	_tween_text.tween_property(_current_task_label, "visible_ratio", 1.0, duration)
