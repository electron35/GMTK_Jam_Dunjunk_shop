extends Node2D
var rng = RandomNumberGenerator.new()

func _on_buy_area_area_entered(area):
		area._sell()
