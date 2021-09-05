extends Label


func _process(delta):
	if Global.wave_count == 5:
		text = str(Global.wave_num)
		Global.reset()
