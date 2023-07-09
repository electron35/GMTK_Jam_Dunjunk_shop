extends MarginContainer

var glow

func _on_texture_rect_pressed():
	Main.add_to_inventory()
	$TextureRect/glow/AnimationPlayer.play("idle")

func _animPlay():
	$TextureRect/glow/AnimationPlayer.play("glow")
