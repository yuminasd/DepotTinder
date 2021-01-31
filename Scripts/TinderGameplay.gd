extends Control

onready var monster = $UI_layer/MonsterLayer/Monster

const DATA := {
	"head" : 
	[ 
		preload("res://Textures/head1.png")
		],
	"torso" : 
	[
		preload("res://Textures/body1.png")
		],
	"legs" : [
		preload("res://Textures/tail.png")]
}

const COLORS := {
	"red" : Color.red,
	"green" : Color.green,
	"blue" : Color.blue,
	"orange" : Color.orange,
	"purple" : Color.purple
}

var lives:int = 3
var currentColorKey
onready var correctColorKey = COLORS.keys()[randi() % COLORS.keys().size()]
onready var timer = $UI_layer/GameTimer
onready var progress_bar = $UI_layer/ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI_layer/Lives.text = str(lives)
	timer.wait_time = progress_bar.value
	timer.connect("timeout", self, "game_over")
	timer.start()
	generate_new_monster()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_bar.value = timer.time_left
	


func proccess_swipe() -> void:
	if (currentColorKey != correctColorKey) :
		lives -=1
		$UI_layer/Lives.text = str(lives)
		#print("score is ", score)
	if (lives <= 0) :
		game_over()
		
		
	
func game_over() -> void : 
	timer.stop()
	$Popup_layer/GameOverPopup.show()

func generate_new_monster() -> void:
	currentColorKey = COLORS.keys()[randi() % COLORS.keys().size()]
	var color = COLORS[currentColorKey]
	monster.change_head_color(color)
	monster.change_torso_color(color)
	monster.change_legs_color(color)

func _on_LostButton_pressed():
	proccess_swipe()
	generate_new_monster()


func _on_FoundButton_pressed():
	proccess_swipe()
	generate_new_monster()
