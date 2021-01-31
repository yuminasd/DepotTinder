extends Node2D

var current_step:int = 0;

const done_button_texture = preload("res://Textures/Tutorial/done.png")
const done_button_pressed_texture = preload("res://Textures/Tutorial/done2.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func step1() -> void: 
	$UI_Layer/Step1.visible = true
	$UI_Layer/health.visible = true
	$UI_Layer/health2.visible = true
	$UI_Layer/health3.visible = true

func step2() -> void:
	$UI_Layer/Step2.visible = true
	$UI_Layer/ColourBar.visible = true

func step3() -> void:
	$UI_Layer/Monster.visible = true
	$UI_Layer/Step3.visible = true
	
func step4() -> void:
	$UI_Layer/Step4.visible = true

func step5() -> void: 
	$UI_Layer/Step5.visible = true

func step6() -> void:
	$UI_Layer/Step6.visible = true
	$UI_Layer/NextButton.texture_normal = done_button_texture
	$UI_Layer/NextButton.texture_pressed = done_button_pressed_texture

func step7() -> void: 
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")


func _on_NextButton_pressed():
	current_step +=1
	match current_step:
		1:
			step1()
		2:
			step2()
		3:
			step3()
		4:
			step4()
		5:
			step5()
		6:
			step6()
		7:
			step7()
