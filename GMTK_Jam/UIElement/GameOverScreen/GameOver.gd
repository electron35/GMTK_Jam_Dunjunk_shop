extends Node2D

var item_sold: int
var time_survived: int

func _ready():
	item_sold = Main.item_sold
	time_survived = int(Time.get_unix_time_from_system() - Main.start_time)
	$CanvasLayer/RichTextLabel.text="You sold %s items\nand you survived for %s s" % [item_sold,time_survived]
