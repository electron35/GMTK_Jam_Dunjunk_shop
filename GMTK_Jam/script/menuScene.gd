extends CenterContainer
var pauseposition

# Called when the node enters the scene tree for the first time.
func _ready():
	$Musique.playing=true;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	$ButtonSound.play()
	pass # Replace with function body.


func _on_button_2_button_up():
	pauseposition = $Musique.get_playback_position()
	$Musique.stop()
	pass # Replace with function body.


func _on_button_3_button_down():
	$Musique.play()
	$Musique.seek(pauseposition)
	pass # Replace with function body.
