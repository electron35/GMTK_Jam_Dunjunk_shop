extends Node

var TimerInstanceCreation
const ScriptAventurer = preload("res://GMTK_Jam/Nodes/Aventurier/SpawnAventurier.tscn")


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
	Adventurerspawned.class
	add_child(Adventurerspawned)
	pass
	
