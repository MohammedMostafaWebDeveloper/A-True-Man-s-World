extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	

	var direction := Input.get_axis("Move Left", "Move Right")
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")

	move_and_slide()
