extends TextureRect

@export_range(1, 100) var wait_time:float = 15

func _ready():
	$SplitBox/Timer/Time.wait_time = wait_time
	
func _process(_delta):
	$SplitBox/Timer.text = str(int($SplitBox/Timer/Time.time_left)) + "s"
	$SplitBox/Money.text = str(Main.money) + "G"

func _on_time_timeout():
	Main.pay_rent()
