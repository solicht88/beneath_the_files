extends Node2D


# TODO: touch up this w/ yan

# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	Global.fade_out()
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("end")
	await $AnimationPlayer.animation_finished
	Global.fade_in()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
