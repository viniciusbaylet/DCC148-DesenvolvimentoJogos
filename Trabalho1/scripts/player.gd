extends CharacterBody2D

@export var speed: float = 350.0 
@export var acceleration: float = 800.0 
@export var friction: float = 1000.0

var speed_modifier: float = 1.0
var is_dying: bool = false 

func _physics_process(delta: float) -> void:
	if is_dying:
		return
		
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	var current_speed = speed * speed_modifier
	if direction != Vector2.ZERO: 
		velocity = velocity.move_toward(direction * current_speed, acceleration * delta) 
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) 		
	move_and_slide()

func set_speed_modifier(new_modifier: float) -> void:
	speed_modifier = new_modifier

# Função chamada quando cai no abismo para fazer o efeito de piscar
func blink_and_vanish() -> void:
	if is_dying:
		return
	is_dying = true
	
	velocity = Vector2.ZERO
	set_process(false)
	set_physics_process(false)
	
	var sprite = get_node_or_null("Sprite2D")
	
	# Faz o player piscar rapidamente 6 vezes
	for i in range(6):
		if sprite:
			sprite.visible = not sprite.visible
		await get_tree().create_timer(0.1, true).timeout 
		
	if sprite:
		sprite.visible = false
