extends Control

var Inventory = preload("res://data/Inventory.tres")

func _process(delta):
	$HBoxContainer/InventoryUI.set_inventory_data(Inventory)
