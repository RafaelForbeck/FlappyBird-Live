extends CharacterBody2D

enum BirdState {
	warmup,
	fly,
	hurt
}

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var status: BirdState

func _ready() -> void:
	go_to_warmup_state()

func _physics_process(delta: float) -> void:
	
	match status:
		BirdState.warmup:
			warmup_state(delta)
		BirdState.fly:
			fly_state(delta)
		BirdState.hurt:
			hurt_state(delta)
		
	move_and_slide()
	
func go_to_warmup_state():
	status = BirdState.warmup
	anim.play("fly")
	
func go_to_fly_state():
	status = BirdState.fly
	anim.play("fly")
	fly()
	
func go_to_hurt_state():
	if status == BirdState.hurt:
		return
		
	status = BirdState.hurt
	anim.play("hurt")
	anim.flip_v = true
	fly()

func warmup_state(_delta):
	if Input.is_action_just_pressed("fly"):
		go_to_fly_state()
		return

func fly_state(delta):
	apply_gravity(delta)
	if Input.is_action_just_pressed("fly"):
		fly()
		
func hurt_state(delta):
	apply_gravity(delta)
	
func fly():
	velocity.y = JUMP_VELOCITY

func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func _on_hitbox_area_entered(_area: Area2D) -> void:
	go_to_hurt_state()
