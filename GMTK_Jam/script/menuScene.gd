extends CenterContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Musique.playing=true;
	pass # Replace with function body.



func _on_jouer_pressed():
	$ButtonSoundMage.play()
	await $ButtonSoundMage.finished
	$Musique.stop()
	$MarginContainer.show()
	pass # Replace with function body.


func _on_credits_pressed():
	$ButtonSoundRogue.play()
	$creditMap.show()
	pass # Replace with function body.


func _on_quitter_pressed():
	$ButtonSoundFight.play()
	await $ButtonSoundFight.finished
	get_tree().quit()
	pass # Replace with function body.


func _on_retour_pressed():
	$ButtonSoundRogue.play()
	$creditMap.hide()
	pass # Replace with function body.


func _on_continue_pressed():
	$ButtonSoundFight.play()
	await $ButtonSoundFight.finished
	get_tree().change_scene_to_file("res://GMTK_Jam/MainScene.tscn")
	pass # Replace with function body.
