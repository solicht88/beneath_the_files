extends Node2D


signal ending


var window_text


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(window_text)
	if window_text is String:
		if window_text == "virus":
			self.visible = false
			ending.emit()
			
			Global.fade_in()
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://scenes/ending.tscn")
		else:
			$Label.text = window_text
	else:
		$Label.visible = false
		$Sprite2D.texture = window_text[1]
		$Area2D/CollisionShape2D.position.y -= 35


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		self.visible = false
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		queue_free()
