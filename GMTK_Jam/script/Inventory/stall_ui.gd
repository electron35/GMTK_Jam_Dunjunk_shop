extends MarginContainer

const Stall = preload("res://GMTK_Jam/ScriptableObjects/Instances/Stall.tres")

const Slot = preload("res://GMTK_Jam/UIElement/ItemSlotUI.tscn")

@onready var stall_box = $StallBox
@onready var grabbed_slot = $GrabbedSlot

var grabbed_item_data: ItemData = null

func _ready():
	setting_up(Stall)

func setting_up(stall_data: StallData):
	stall_data.update_stall.connect(on_stall_update)
	stall_data.stall_interact.connect(on_stall_interact)
	populate_stall(stall_data)

func _process(_delta):
	if Main.hold_item == null:
		grabbed_slot.hide()
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5)
	
func populate_stall(stall_data: StallData):
	for child in stall_box.get_children():
		child.queue_free()
		
	for item_data in stall_data.item_datas:
		var slot = Slot.instantiate()
		stall_box.add_child(slot)
		
		slot.item_clicked.connect(stall_data.on_slot_clicked)
		
		if item_data:
			slot.set_slot_data(item_data)
	
	

func on_stall_update(stall_data: StallData):
	populate_stall(stall_data)
	
func on_stall_interact(stall_data : StallData,index: int, button:int):
	#print ("%s %s %s" % [inventory_data, index, button])

	match [grabbed_item_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_item_data = stall_data.grab_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			grabbed_item_data = stall_data.drop_slot_data(grabbed_item_data, index)
	update_grabbed_slot()


func update_grabbed_slot():
	if grabbed_item_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_item_data)
	else:
		grabbed_slot.hide()

