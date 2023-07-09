class_name StallData
extends Resource



const MAX_SIZE:int = 5
signal update_stall(stallData : StallData)
signal stall_interact(stallData : StallData,index: int, button:int)
@export var item_datas: Array[ItemData]

func _process(_delta):
	pass

func add(item):
	if (item_datas.size()>=MAX_SIZE):
		item_datas.pop_front()
	item_datas.append(item)
	update_stall.emit(self)
	
func grab_slot_data(index: int) -> ItemData:
	var item_data = item_datas[index]
	
	if item_data:
		item_datas.pop_at(index)
		update_stall.emit(self)
		add_item_to_main(item_data)
		return item_data
	else:
		add_item_to_main(null)
		return null

func drop_slot_data(grabbed_slot_data: ItemData, index: int) -> ItemData:
	var item_data = item_datas[index]
	
	self.add(grabbed_slot_data)
	update_stall.emit(self)
	
	if item_data:
		item_datas.pop_at(index)
		update_stall.emit(self)
		add_item_to_main(item_data)
		return item_data
	else:
		add_item_to_main(null)
		return null
		
func add_item_to_main(item: ItemData):
	Main.hold_item = item
		
func on_slot_clicked(index: int, button: int):
	stall_interact.emit(self,index,button)
