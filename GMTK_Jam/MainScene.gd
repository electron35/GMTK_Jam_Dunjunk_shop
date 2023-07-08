extends Node2D

@onready var craft_inventory = $CraftingMenu/CraftInventory

func _on_crafting_menu_pressed():
	craft_inventory.visible = !craft_inventory.visible
		
