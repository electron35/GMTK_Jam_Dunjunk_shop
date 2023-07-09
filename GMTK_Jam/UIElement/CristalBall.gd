extends MarginContainer

var glow_is_active:bool = false

func _process(_delta):
	if !glow_is_active and Main.AdventurerDead:
		_animPlay()
func _on_texture_rect_pressed():
	Main.add_to_inventory()
	$TextureRect/glow/AnimationPlayer.play("idle")
	glow_is_active = false
	Main.AdventurerDead = false

func _animPlay():
	glow_is_active = true
	$TextureRect/glow/AnimationPlayer.play("glow")
