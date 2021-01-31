extends Control

onready var monster = $MonsterLayer/Monster

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

var score:int = 0;
var currentColorKey
onready var correctColorKey = COLORS.keys()[randi() % COLORS.keys().size()]


# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = str(score)
	generate_new_monster()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func proccess_found_swipe() -> void:
	if (currentColorKey == correctColorKey) :
		score += 1
		$Score.text = str(score)
		print("score is ", score)
	

func generate_new_monster() -> void:
	currentColorKey = COLORS.keys()[randi() % COLORS.keys().size()]
	var color = COLORS[currentColorKey]
	monster.change_head_color(color)
	monster.change_torso_color(color)
	monster.change_legs_color(color)

func _on_LostButton_pressed():
	generate_new_monster()


func _on_FoundButton_pressed():
	proccess_found_swipe()
	generate_new_monster()
