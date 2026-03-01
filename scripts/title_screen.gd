extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("enter"):
		Global.fade_in()
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/game/game.tscn")
