extends HSplitContainer

var money = 0

func _init():
	pass
	
func _process(delta):
	money += 1
	$Background/Timer.text = str(int($Background/Timer/Time.time_left)) + "s"
	$Background/Money.text = str(money)

func _on_time_timeout():
	money -= 100
