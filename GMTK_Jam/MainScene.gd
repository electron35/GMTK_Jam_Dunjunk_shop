extends Node2D

@onready var craft_inventory = $Foreground/CraftInventory


func _ready():
	Main.main_scene_ref = self
	$BossaNova.play()

func _on_crafting_menu_pressed():
	craft_inventory.visible = !craft_inventory.visible
		


func _on_button_pressed():
	$Foreground/Button/TextureRect.visible = !$Foreground/Button/TextureRect.visible
