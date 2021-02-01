extends Node

signal tinder_swiped(is_left)

var starting_x: float

func _input(event):
	pass
#	if not (event is InputEventScreenTouch or event is InputEventMouseButton):
#		return
#	if event.is_pressed():
#		$Timer.start()
#		starting_x = event.position.x
#	elif not $Timer.is_stopped():
#		$Timer.stop()
#		if event.position.x > starting_x:
#			emit_signal("tinder_swiped", false)
#		elif event.position.x < starting_x:
#			emit_signal("tinder_swiped", true)
