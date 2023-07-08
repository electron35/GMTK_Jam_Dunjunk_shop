extends Area2D

var AdventurerInShop
var classeAventurer
var objetVendre
var powerAventurer
var speedAventurer
var AdvHasSell
var AdvhasBuy
var SpeedAdvBuy

func _ready():
	AdventurerInShop=true
	AdvHasSell=false
	AdvhasBuy=false

func _process(delta):
	if(AdventurerInShop==true):
		if(AdvhasBuy):
			position.x -= delta*SpeedAdvBuy
		else:
			position.x -= delta*speedAventurer

func _sell():
	print("Adventurer sells you Object for X gold")
	AdvHasSell=true

func _buy():
	print("Adventurer buy you weapon for X gold")
	AdvhasBuy=true

# lorsque l'aventurier va dans le donjon
func _exitShop():
	AdventurerInShop=false
