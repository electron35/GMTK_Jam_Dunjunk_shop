class_name AdventurerData
extends Resource

@export var className: String
@export var speed: int
@export var puissance: int

func _init(name="null", _speed=10, puissance=1):
	className = name
	speed = _speed
	puissance=1
