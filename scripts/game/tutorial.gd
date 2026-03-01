extends Control


var tutorial = [
	[Vector2(340, 40), "> Select a file by clicking it to investigate for any viruses
	
	<esc> to skip
	<enter> to continue"],
	[Vector2(796, 620), "> Type the password shown below to unlock the file's contents
	
	<enter> to continue"],
	[Vector2(340, 410), "> Read and close text or image files by clicking the 'x' in the title bar 
	
	<enter> to continue"],
	[Vector2(340, 40), "> Repeatedly click the virus stealing your files
	
	<enter> to continue"],
	[Vector2(340, 40), "> Repeat previous steps until you find the virus in the computer
	
	<enter> to continue"]
]
var cur_step = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		queue_free()


func _input(event):
	if event.is_action_pressed("esc"):
		queue_free()
	elif Input.is_action_pressed("enter"):
		cur_step += 1
		if cur_step == 5:
			queue_free()
		else:
			_proceed_tutorial(cur_step)


func _proceed_tutorial(index):
	self.position = tutorial[index][0]
	$window/Label.text = tutorial[index][1]
