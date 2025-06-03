extends Node2D

const PIPES = preload("res://entities/pipes.tscn")

func spawn_pipes():
	var new_pipes = PIPES.instantiate()
	add_child(new_pipes)

func _on_timer_timeout() -> void:
	spawn_pipes()
