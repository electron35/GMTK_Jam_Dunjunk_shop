class_name StallData
extends Resource



const MAX_SIZE:int = 5
signal update_stall(stallData : StallData)
@export var item_datas: Array[ItemData]

func add(item):
	if (item_datas.size()>=MAX_SIZE):
		item_datas.pop_front()
	item_datas.append(item)
	update_stall.emit(self)
