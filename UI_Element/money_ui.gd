extends HSplitContainer

var money = 0

func _init():
	pass
	
func _process(delta):
	money += 1
	$Timer.text = str(int($Timer/Time.time_left)) + "s"
	$Money.text = str(money)
	


func _on_time_timeout():
	money -= 100
