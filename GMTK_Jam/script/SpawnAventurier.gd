extends Node

var TimerInstanceCreation
const ScriptAventurer = preload("res://GMTK_Jam/Nodes/Aventurier/aventurier.tscn")

const Classes = [
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/Rogue.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Adventurers/Fighter.tres")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time=TimerInstanceCreation
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	_create_adventurer()
	$Timer.wait_time=TimerInstanceCreation
	$Timer.start()
	pass # Replace with function body.

func _create_adventurer():
	var Adventurerspawned = ScriptAventurer.instantiate()
	# TODO: randomiser la classe
	Adventurerspawned.setClass(Classes[0])
	# TODO: spawner un objet
	add_child(Adventurerspawned)
	pass
	
