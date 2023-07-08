extends HSplitContainer

func _init():
	pass
	
func _process(delta):
	Main.money += 1
	$Timer.text = str(int($Timer/Time.time_left)) + "s"
	$Money.text = str(Main.money)

func _on_time_timeout():
	Main.money -= Main.rent_value
