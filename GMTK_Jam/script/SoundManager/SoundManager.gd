extends Node

@export var SoundList : SoundListResource

func ImportSound(nameSound:String)->AudioStreamWAV:
	var sound:AudioStreamWAV = SoundList.soundList.find_key(nameSound)
	return sound
