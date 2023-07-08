extends Area2D

var adventurerInShop
@export var classAdventurer:String
var objectSell
var powerAventurer
@export var speedAventurer:int
var advHasSell
var advhasBuy
var speedAdvBuy

func _ready():
	adventurerInShop=true
	advHasSell=false
	advhasBuy=false

func _process(delta):
	if(adventurerInShop==true):
		if(advhasBuy):
			position.x -= delta*speedAdvBuy
		else:
			position.x -= delta*speedAventurer

func _sell():
	print("Adventurer sells you Object for X gold")
	advHasSell=true

func _buy():
	print("Adventurer buy you weapon for X gold")
	advhasBuy=true

# lorsque l'aventurier va dans le donjon
func _exitShop():
	adventurerInShop=false
