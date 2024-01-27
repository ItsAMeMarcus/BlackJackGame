extends CharacterBody2D

var inspectable_text : RichTextLabel
@export var SPEED = 100.0
@export var JUMP_VELOCITY = -100.0
var gravity  = ProjectSettings.get_setting("physics/2d/default_gravity")

 #custom signals
signal update_lives(lives, max_lives)

# health stats
var max_lives = 3
var lives = 3



func player_animations():
	if Input.is_action_pressed("ui_left") and Global.is_jumping == false:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
		$CollisionShape2D.position.x = -7
		
	if Input.is_action_pressed("ui_right") and Global.is_jumping == false:
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
		Global.is_attacking = true
		$AnimatedSprite2D.play("attack")
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Global.is_jumping = true
		$AnimatedSprite2D.play("jump")
	else:
		Global.is_jumping = false

func take_damage():
	if lives > 0:
		update_lives.emit(lives, max_lives)
		print(lives)
		$AnimatedSprite2D.play("damage")
		set_physics_process(false)

func _on_animated_sprite_2d_animation_finished():
	Global.is_attacking = false
	Global.is_on_door = false
	set_physics_process(true)

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	horizontal_movement()
	#aplica movimento
	move_and_slide()
	#aplica animacao
	if !Global.is_jumping and !Global.is_attacking:
		player_animations()

