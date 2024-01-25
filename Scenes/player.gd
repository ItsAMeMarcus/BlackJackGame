extends CharacterBody2D

var inspectable_text : RichTextLabel
@export var SPEED = 100.0
@export var JUMP_VELOCITY = -100.0
var gravity  = ProjectSettings.get_setting("physics/2d/default_gravity")



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
		Global.is_attacking = true
		$AnimatedSprite2D.play("attack")
		
func _on_animated_sprite_2d_animation_finished():
	Global.is_attacking = false
	Global.is_on_door = false
# Replace with function body.

#movimento e fisica
func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")

	# Get the input direction.
	horizontal_movement()
	#aplica movimento
	move_and_slide()
	#aplica animacao
	if !Global.is_attacking:
		player_animations()

