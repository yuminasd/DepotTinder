extends Node

#color changing signals
signal head_color_changed(color)
signal torso_color_changed(color)
signal legs_color_changted(color)

#texture changing signals
signal head_texture_changed(texture)
signal torso_texture_changed(texture)
signal legs_texture_chagned(texture)


const DATA := {
	"head" : 
	[ 
		preload("Textures/head1.png")
		],
	"torso" : 
	[
		preload("Textures/body1.png")
		],
	"legs" : [
		preload("Textures/tail.png")]
}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MonsterCreator_texture_changed(texture: StreamTexture, key:String) -> void:
	emit_signal(key + "_changed", texture)

func _on_MonsterCreator_color_changed(color: Color, key:String) -> void:
	emit_signal(key + "_changed", color); 
