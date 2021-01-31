class_name MonsterCreator
extends Node2D


onready var body := $Body

onready var head := $Body/Head
onready var torso := $Body/Torso
onready var legs := $Body/Legs


func _ready():
	pass

#methods to change color of head, torso, legs
func change_head_color(color) -> void:
	head.modulate = color

func change_torso_color(color) -> void:
	torso.modulate = color

func change_legs_color(color) -> void: 
	legs.modulate = color 


#methods to change texture of head, torso, legs
func _on_head_texture_changed(texture) -> void: 
	head.texture = texture

func _on_torso_texture_changed(texture) -> void: 
	head.texture = texture

func _on_legs_texture_changed(texture) -> void: 
	head.texture = texture


