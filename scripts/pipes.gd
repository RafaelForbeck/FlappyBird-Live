extends Node2D

var speed = 100

func _process(delta: float) -> void:
	position.x -= speed * delta
