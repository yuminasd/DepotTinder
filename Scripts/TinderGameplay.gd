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
	"red" : Color(1.0, 0.0, 1.0),
	"green" : Color(0.0, 1.0, 0.0),
	"blue" : Color(0.0, 0.0, 1.0)
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func generate_new_monster() -> void:
	var colorKey = COLORS.keys()[randi() % COLORS.keys().size()]
	var color = COLORS[colorKey]
	monster.change_head_color(color)
	monster.change_torso_color(color)
	monster.change_legs_color(color)

func _on_LostButton_pressed():
	generate_new_monster()


func _on_FoundButton_pressed():
	generate_new_monster()
