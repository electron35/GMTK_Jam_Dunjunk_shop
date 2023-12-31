extends Control

@export var adventurer_power: int = 0
@export var lootInDungeon: bool

const mat_ref = [
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Ring.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stick.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stone.tres")
]

var mat_item:MaterialData

func _create_dungeon_instance(power:int,item_type: String):
	adventurer_power = power
	var time:int = int(power / 5)
	time = 30 if (time > 30) else time 
	$Timer.wait_time = time
	
	match item_type:
		"Bow":
			mat_item = mat_ref[0]
		"Sword":
			mat_item = mat_ref[1]
		"Wand":
			mat_item = mat_ref[2]
	$Timer.start()
	

func _on_timer_timeout():
	Main.material_add(mat_item,adventurer_power)
	Main.AdventurerDead = true
	self.queue_free()
