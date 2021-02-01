extends Node

onready var monster = $UI/Monster

#const DATA := {
#	"head" : 
#	[ 
#		#preload("res://Textures/head1.png")
#
#		],
#	"torso" : 
#	[
#		preload("res://Textures/body1.png")
#		],
#	"legs" : [
#		preload("res://Textures/tail.png")]
#}

const CREATURES := {
	"Cat" :
		{
		"Head" : preload("res://Textures/Creatures/Cat/CatHead.png") ,
		"Body" : preload("res://Textures/Creatures/Cat/CatBody.png") ,
		"Leg" : preload("res://Textures/Creatures/Cat/CatLeg.png") ,
		"Constant" : preload("res://Textures/Creatures/Cat/CatConstant.png") 
		},
	"Cream" :
	{
		"Head" : preload("res://Textures/Creatures/Cream/CreamHead.png"),
		"Body" : preload("res://Textures/Creatures/Cream/CreamBody.png"),
		"Leg" : preload("res://Textures/Creatures/Cream/CreamLeg.png"),
		"Constant" : preload("res://Textures/Creatures/Cream/CreamConstant.png")
	},
	"Green Duder" :
	{
		"Head" : preload("res://Textures/Creatures/GreenDuder/head.png"),
		"Body" : preload("res://Textures/Creatures/GreenDuder/arm.png"),
		"Leg" : preload("res://Textures/Creatures/GreenDuder/leg.png"),
		"Constant" : preload("res://Textures/Creatures/GreenDuder/constant.png")
	},
	"Dab Person" : 
		{
			"Head" : preload("res://Textures/Creatures/DabPerson/body.png"),
			"Body" : preload("res://Textures/Creatures/DabPerson/head.png"),
			"Leg" : preload("res://Textures/Creatures/DabPerson/legs.png"),
			"Constant" : null
		}
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


onready var TimeLeft = $TimeLeft
onready var TimerBar = $UI/TimerBar

func _ready():
	TimeLeft.start()
	generate_new_monster()
	$UI/ColorBar.modulate = COLORS[correctColorKey]
	TimeLeft.connect("timeout", self, "game_over")

func _process(delta):
	TimerBar.value = TimeLeft.time_left / TimeLeft.wait_time * 100

func proccess_found_swipe() -> void:
	if (currentColorKey != correctColorKey) :
		lives -=1
		$Loss.play()
		process_lives()
		#$UI_layer/Lives.text = str(lives)
		#print("score is ", score)
	else:
		$Point.play()
		
	if (lives <= 0) :
		game_over()
		
func process_lost_swipe() -> void: 
	if (currentColorKey == correctColorKey) :
		lives -= 1
		$Loss.play()
		process_lives()
	else:
		$Point.play()
		
		
	if (lives <= 0) :
		game_over()
		
		
func game_over(): 
	get_tree().change_scene("res://Scenes/GameOverScene.tscn")

func process_lives():
	if (lives >= 3):
		$UI/HeartsContainer/health.visible = true
		$UI/HeartsContainer/health2.visible = true
		$UI/HeartsContainer/health3.visible = true
	elif (lives >= 2):
		$UI/HeartsContainer/health.visible = true
		$UI/HeartsContainer/health2.visible = true
		$UI/HeartsContainer/health3.visible = false
	elif (lives >= 1):
		$UI/HeartsContainer/health.visible = true
		$UI/HeartsContainer/health2.visible = false
		$UI/HeartsContainer/health3.visible = false
	elif (lives >= 0): 
		$UI/HeartsContainer/health.visible = false
		$UI/HeartsContainer/health2.visible = false
		$UI/HeartsContainer/health3.visible = false

func generate_new_monster() -> void:
	currentColorKey = COLORS.keys()[randi() % COLORS.keys().size()]
	var color = COLORS[currentColorKey]
	monster.change_color(color)
	
	var monsterKey = CREATURES.keys()[randi() % CREATURES.keys().size()]
	
	var monsterDict = CREATURES[monsterKey]
	
	monster.change_head_texture(monsterDict["Head"])
	monster.change_body_texture(monsterDict["Body"])
	monster.change_legs_texture(monsterDict["Leg"])
	monster.change_constant_texture(monsterDict["Constant"])

func swipe(is_left):
	if (is_left):
		print("LEFT")
		handle_lost_event()
	else:
		print("RIGHT")
		handle_found_event()
	

func handle_lost_event():
	process_lost_swipe()
	generate_new_monster()

func handle_found_event():
	proccess_found_swipe()
	generate_new_monster()
	
func _on_SwipeDetector_tinder_swiped(is_left):
	swipe(is_left)
	

func _on_Found_button_up():
	handle_found_event()

func _on_Lost_button_up():
	handle_lost_event()

