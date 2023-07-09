extends Node2D

var money
var rent_value

func _init():
	money = 1000
	rent_value = 1000

func pay_rent():
	money -= rent_value
	rent_value *= 1.2
	if (money < 0):
		print("TU AS PERDU SALE PAUVRE, RESPECTE LE CAPITAL ESPECE D'ANARCHISTE ECO-TERRORISTE ZADISTE QUI SORT DE L'ARC REPUBLICAIN")
