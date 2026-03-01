extends Node2D


signal open_file(file_name)


var can_click = true
var being_taken = false


# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	$Label.text = self.name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click") and can_click:
		open_file.emit(self.name)



func _on_area_2d_mouse_entered():
	if can_click:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _being_taken():
	pass
