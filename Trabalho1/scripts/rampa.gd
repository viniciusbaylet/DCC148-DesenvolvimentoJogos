extends Area2D

@export var speed_modifier: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void: 
	if body.has_method("set_speed_modifier"): 
		body.set_speed_modifier(speed_modifier) 
		
func _on_body_exited(body: Node2D) -> void: 
	if body.has_method("set_speed_modifier"): 
		body.set_speed_modifier(1.0)
