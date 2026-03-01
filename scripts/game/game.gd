extends Node2D


var cur_letter_index: int = 0
var cur_word = null


# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	Global.fade_out()
	$RichTextLabel.visible = false
	
	# temp for testing
	_pick_password()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _pick_password():
	randomize()
	cur_word = Global.passwords.pick_random()
	#print(cur_word)
	$RichTextLabel.text = "[center]" + cur_word
	$RichTextLabel.visible = true


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and cur_word != null:
		var key_event := event as InputEventKey
		if OS.is_keycode_unicode(key_event.keycode):
			var typed_char = String.chr(key_event.unicode).to_lower()
			#print(typed_char)
			if cur_word.substr(cur_letter_index, 1) == typed_char:
				cur_letter_index  += 1
				if cur_word.length() == cur_letter_index:
					#print("finished!")
					cur_word = null
					cur_letter_index = 0
					$RichTextLabel.visible = false
				else:
					$RichTextLabel.text = "[center][color=#0a2f4b]" + cur_word.substr(0, cur_letter_index) + "[/color]" + cur_word.substr(cur_letter_index)
				
