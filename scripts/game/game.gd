extends Node2D


var cur_letter_index: int = 0
var cur_word = null
var cur_file = null
var cur_file_index = null


var window_long = preload("res://scenes/game/sprites/window_long.tscn")
var window_wide = preload("res://scenes/game/sprites/window_wide.tscn")
var virus_node = preload("res://scenes/game/sprites/virus.tscn")


# TODO: add music
# TODO: implement other possible files
# TODO: playtest, game balancing


# Called when the node enters the scene tree for the first time.
func _ready():
	await ready
	Global.fade_out()
	$RichTextLabel.visible = false
	
	for file in $files.get_children():
		file.open_file.connect(_pick_password)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _pick_password(file_name):
	cur_file = file_name
	Global.opened_files.append(cur_file)
	
	var i = 0
	for file in $files.get_children():
		if file.name == file_name:
			cur_file_index = i
		file.can_click = false
		file.has_opened = true
		i += 1
	
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
			
			if cur_word.substr(cur_letter_index, 1) == typed_char:
				cur_letter_index  += 1
				if cur_word.length() == cur_letter_index:
					
					# open window w/ corresponding file text
					var window_index = randi_range(0, 1)
					var new_window
					
					if not Global.entries[cur_file_index] is String:
						new_window = window_wide.instantiate()
					else:
						new_window = [window_long, window_wide][window_index].instantiate()
					
					var coords: Vector2
					if window_index == 0:
						coords = Vector2(randi_range(300, 1400), randi_range(20, 310))
					else:
						coords = Vector2(randi_range(300, 1260), randi_range(20, 450))
					
					new_window.set_position(coords)
					new_window.window_text = Global.entries[cur_file_index]
					$windows.add_child(new_window)
					
					
					cur_word = null
					cur_file = null
					cur_file_index = null
					cur_letter_index = 0
					$RichTextLabel.visible = false
					
					for file in $files.get_children():
						if file.name not in Global.opened_files:
							file.can_click = true
				else:
					$RichTextLabel.text = "[center][color=#0a2f4b]" + cur_word.substr(0, cur_letter_index) + "[/color]" + cur_word.substr(cur_letter_index)


# virus takes a file
var virus_target = null
var virus_target_position = null


func _virus_taking_file():
	pass


func _virus_stopped():
	await get_tree().create_timer(0.1).timeout
	virus_target.position = virus_target_position
	await get_tree().create_timer(0.1).timeout
	
	if not virus_target.has_opened:
		virus_target.can_click = true
		print("here")
	
	virus_target = null
	virus_target_position = null


func _virus_took_file():
	Global.taken_files.append(virus_target.name)
	virus_target = null
	virus_target_position = null


func _on_virus_timer_timeout():
	var virus_can_take = false
	var virus = virus_node.instantiate()
	
	# prevent from taking virus file + currently open file
	while not virus_can_take:
		virus_target = $files.get_children().pick_random()
		var target_index = $files.get_children().find(virus_target)
		
		if not target_index == cur_file_index or not Global.entries[target_index] == "virus" or not virus_target.name in Global.taken_files:
			virus_can_take = true
	
	virus_target_position = virus_target.position
	virus_target.can_click = false
	
	virus.target = virus_target
	virus.position.x = 1920
	virus.target_x = virus_target.position.x
	virus.target_y = virus_target.position.y
	
	virus.taking.connect(_virus_taking_file)
	virus.stopped.connect(_virus_stopped)
	virus.target_taken.connect(_virus_took_file)
	
	add_child(virus)
