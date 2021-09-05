extends Node2D

var enemy = preload("res://scenes/Enemy.tscn")
onready var timer = get_node("SpawnTimer")
onready var next_wave = get_node("UI/Control/Next_wave-text")

func _process(delta):
	if Global.wave_count == 5:
		wave_check()

func wave_check():
	timer.stop()
	print("stop")
	timer.set_wait_time(2)
	next_wave.visible = true
	timer.start()

func _on_SpawnTimer_timeout():
	next_wave.visible = false
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position
