class_name MonsterCreator
extends Node2D



func _ready():
	pass


func change_color(color) -> void:
	$Body/Body.modulate = color
	$Body/Leg.modulate = color
	$Body/Head.modulate = color




#methods to change texture of head, torso, legs
func change_head_texture(texture) -> void: 
	$Body/Head.texture = texture
	
func change_body_texture(texture) -> void:
	$Body/Body.texture = texture

func change_legs_texture(texture) -> void: 
	$Body/Leg.texture = texture
	
func change_constant_texture(texture) -> void:
	$Body/Constant.texture = texture
	


