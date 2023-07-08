class_name AdventurerData
extends Resource

@export var className: String = ""
@export var texture_neutral: Texture = null
@export var texture_sword: Texture = null
@export var texture_wand: Texture = null
@export var texture_bow: Texture = null


func _init(name="null"):
	className = name
