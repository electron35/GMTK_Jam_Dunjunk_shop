extends Node2D

var item_sold: int
var time_survived: int

func _ready():
	item_sold = Main.item_sold
	#time_survived = int(Time.get_unix_time_from_system() - Main.start_time)
	$CanvasLayer/RichTextLabel.text="You sold %s items" % [item_sold]
	


func _on_button_pressed():
	get_tree().change_scene_to_file("res://GMTK_Jam/menuScene.tscn")
