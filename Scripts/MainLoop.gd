extends Node

onready var TimeLeft = $TimeLeft
onready var TimerBar = $UI/TimerBar

func _ready():
	TimeLeft.start()

func _process(delta):
	TimerBar.value = TimeLeft.time_left / TimeLeft.wait_time * 100

func swipe(is_left):
	if (is_left):
		print("LEFT")
	else:
		print("RIGHT")
	pass


func _on_SwipeDetector_tinder_swiped(is_left):
	swipe(is_left)
