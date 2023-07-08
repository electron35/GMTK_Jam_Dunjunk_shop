extends Area2D

var adventurerInShop
@export var classAdventurer:String
var objectSell
var powerAventurer
@export var speedAdventurer:int
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
			position.x -= delta*speedAdventurer

func _sell():
	print("Adventurer sells you Object for X gold")
	advHasSell=true

func _buy():
	print("Adventurer buy you weapon for X gold")
	advhasBuy=true

# lorsque l'aventurier va dans le donjon
func _exitShop():
	adventurerInShop=false

# parametre l'aventurier en fonction de la classe passee en argument
func setClass(data: AdventurerResource):
	classAdventurer = data.className
	speedAdventurer = data.speed
