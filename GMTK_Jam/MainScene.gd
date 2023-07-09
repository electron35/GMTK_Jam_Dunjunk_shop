extends Node2D

@onready var craft_inventory = $Foreground/CraftingMenu/CraftInventory

func _ready():
	Main.main_scene_ref = self

func _on_crafting_menu_pressed():
	craft_inventory.visible = !craft_inventory.visible
		
