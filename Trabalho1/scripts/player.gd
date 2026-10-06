extends CharacterBody2D


@export var speed: float = 350.0 
@export var acceleration: float = 800.0 
@export var friction: float = 300.0

var speed_modifier: float = 1.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	var current_speed = speed * speed_modifier
	if direction != Vector2.ZERO: 
		velocity = velocity.move_toward(direction * current_speed, acceleration * delta) 
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) 		
	move_and_slide()

func set_speed_modifier(new_modifier: float) -> void:
	speed_modifier = new_modifier
	
	
