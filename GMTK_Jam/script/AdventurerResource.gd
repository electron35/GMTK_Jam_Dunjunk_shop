class_name AdventurerData
extends Resource

@export var className: String
@export var speed: int


func _init(name="null", _speed=10):
	className = name
	speed = _speed
