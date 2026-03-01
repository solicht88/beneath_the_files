extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	$Label.text = self.name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		pass
