extends MarginContainer

var Stall = preload("res://GMTK_Jam/ScriptableObjects/Instances/Stall.tres")

const Slot = preload("res://GMTK_Jam/UIElement/ItemSlotUI.tscn")
@onready var stall_box = $StallBox
func _ready():
	populate_stall(Stall)
	Stall.update_stall.connect(on_stall_update)

func populate_stall(stall_data: StallData):
	for child in stall_box.get_children():
		child.queue_free()
		
	for item_data in stall_data.item_datas:
		var slot = Slot.instantiate()
		stall_box.add_child(slot)
		
		if item_data:
			slot.set_slot_data(item_data)

func on_stall_update(stall_data: StallData):
	populate_stall(stall_data)

