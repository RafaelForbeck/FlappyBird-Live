extends Node2D

const PIPES = preload("res://entities/pipes.tscn")

var random = RandomNumberGenerator.new()

func spawn_pipes():
	var new_pipes = PIPES.instantiate()
	add_child(new_pipes)
	new_pipes.position.y = random.randf_range(-60, 60)

func _on_timer_timeout() -> void:
	spawn_pipes()
