extends Node2D


signal taking
signal stopped
signal target_taken


var target
var target_x
var target_y
var speed = 500
var hits_taken = 0
var health = randi_range(2, 6)
var moving_to_target = true


# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	self.position.y = target_y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(delta):
	if moving_to_target:
		position.x = move_toward(position.x, target_x, speed*delta)
		
		if position.x <= target_x:
			moving_to_target = false
			taking.emit()
	else:
		position.x = move_toward(position.x, 2020, speed*delta)
		target.position.x = move_toward(target.position.x, 1920, speed*delta)
		if position.x >= 2020:
			target_taken.emit()


func _on_area_2d_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		hits_taken += 1
		if hits_taken == health:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			stopped.emit()
			queue_free()
