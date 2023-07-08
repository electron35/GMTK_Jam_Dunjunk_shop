extends Node2D

@onready var craft_inventory = $Foreground/CraftingMenu/CraftInventory

func _on_crafting_menu_pressed():
	craft_inventory.visible = !craft_inventory.visible
		
