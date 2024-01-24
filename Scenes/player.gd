extends CharacterBody2D


@export var SPEED = 100.0
@export var JUMP_VELOCITY = -100.0
@export var gravity = -200

var is_attacking = false
var can_jump:bool


func player_animations():
	if Input.is_action_pressed("ui_left") || Input.is_action_just_released("ui_jump"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
		$CollisionShape2D.position.x = -7
		
	if Input.is_action_pressed("ui_right") || Input.is_action_just_released("ui_jump"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
		$CollisionShape2D.position.x = -7
		
	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("default")
	
func horizontal_movement():
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity.x = horizontal_input * SPEED

func _input(event):
	if event.is_action_pressed("ui_attack"):
		is_attacking = true
		$AnimatedSprite2D.play("attack")
		
	if event.is_action_pressed("ui_jump") and can_jump:
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")

#movimento e fisica
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if is_on_floor() && !Input.is_action_pressed("ui_jump"):
		can_jump = true
		
	#aplica movimento
	horizontal_movement()
	
	move_and_slide()
	
	#aplica animacao
	if !is_attacking:
		player_animations()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	#move_and_slide()
	
	#


func _on_animated_sprite_2d_animation_finished():
	is_attacking = false # Replace with function body.
