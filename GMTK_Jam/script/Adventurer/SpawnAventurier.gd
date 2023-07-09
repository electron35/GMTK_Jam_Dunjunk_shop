extends Area2D

var rng = RandomNumberGenerator.new()

var TimerInstanceCreation = 5
const ScriptAventurer = preload("res://GMTK_Jam/Nodes/Aventurier/aventurier.tscn")
@onready var timer = $Timer
const Classes = [
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/RogueF.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/FighterF.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/MageF.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/RogueM.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/FighterM.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/MageM.tres")
	
]

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time=0.1
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	_create_adventurer()
	$Timer.wait_time=TimerInstanceCreation
	$Timer.start()
	pass # Replace with function body.

func _create_adventurer():
	var Adventurerspawned = ScriptAventurer.instantiate()
	rng.randomize()
	Adventurerspawned.setClass(Classes[rng.randi_range(0,5)])
	
	
	# TODO: spawner un objet
	add_child(Adventurerspawned)
	Adventurerspawned.position=$SpawnAdventurer.position
