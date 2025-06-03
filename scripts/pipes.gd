extends Node2D

var speed = 60

func _process(delta: float) -> void:
	position.x -= speed * delta
