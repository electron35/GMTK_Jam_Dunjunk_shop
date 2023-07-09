extends Node2D

const dungeonConst = preload("res://GMTK_Jam/Nodes/Dungeon.tscn")

var money:int
var rent_value: float

var hold_item: ItemData

func _init():
	money = 1000
	rent_value = 1000

func pay_rent():
	money -= rent_value
	rent_value *= 1.2
	if (money < 0):
		print("TU AS PERDU SALE PAUVRE, RESPECTE LE CAPITAL ESPECE D'ANARCHISTE ECO-TERRORISTE ZADISTE QUI SORT DE L'ARC REPUBLICAIN")

