extends CharacterBody2D


@export var speed: float = 350.0 
@export var acceleration: float = 800.0 
@export var friction: float = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	if direction != Vector2.ZERO: 
		velocity = velocity.move_toward(direction * speed, acceleration * delta) 
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) 
		
	move_and_slide()
	
	
