extends TextureButton

func _on_play_pressed():
	$ButtonPress.play()
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Scenes/MainLoop.tscn")
