extends PanelContainer

@export var item_name = ""
@export var quality: int = 0
@onready var texture_rect = $MarginContainer/TextureRect

var item_reference: ItemData

func set_slot_data(item : ItemData):
	item_reference = item
	item_name=item.item_name
	texture_rect.texture = item.texture
	quality = item.quality
	
