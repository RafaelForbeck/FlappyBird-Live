extends Sprite2D

var speed = 100

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x <= -24:
		position.x += 24
		
