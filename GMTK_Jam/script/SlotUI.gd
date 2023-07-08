extends PanelContainer

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quality_label = $QualityLabel

signal slot_clicked(index: int, button: int)

func set_slot_data(slot_data: SlotData):
	var item_data = slot_data.item_data
	texture_rect.texture = item_data.texture
	tooltip_text = "%s" % [item_data.type]
	
	quality_label.text = "%x" % [slot_data.quality]
	quality_label.show()


func _on_gui_input(event):
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)
