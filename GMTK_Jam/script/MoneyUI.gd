extends TextureRect

@export_range(1, 100) var wait_time:float = 15

func _ready():
	$SplitBox/Timer/Time.wait_time = wait_time
	$RentText.text="Next Rent: %s" % [str(Main.rent_value)]
	
func _process(_delta):
	$SplitBox/Timer.text = str(int($SplitBox/Timer/Time.time_left)) + "s"
	$SplitBox/Money.text = str(Main.money) + "G"

func _on_time_timeout():
	Main.pay_rent()
	$AudioStreamPlayer.play()
	$perteSous/AnimationPlayer.play("baddisappear")
	$RentText.text="Next Rent: %s" % [str(Main.rent_value)]
