extends PanelContainer

@export var item_name = ""
@export var quality: int = 0
@onready var texture_rect = $MarginContainer/TextureRect

var item_reference: ItemData

signal item_clicked(index: int, button: int)

func set_slot_data(item : ItemData):
	item_reference = item
	item_name=item.item_name
	texture_rect.texture = item.texture
	quality = item.quality
	$MarginContainer/Label.text = str(quality)
	
func _on_gui_input(event):
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		item_clicked.emit(get_index(), event.button_index)
