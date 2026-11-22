extends AnimatableBody2D

@export var move_offset: Vector2 = Vector2(176, 0) # Distância em pixels (X = lado, Y = altura)
@export var duration: float = 3.0 # Tempo em segundos para ir de uma ponta à outra

func _ready() -> void:
	var start_pos: Vector2 = position
	
	# Animação contínua de ida e volta
	var tween := create_tween().set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(self, "position", start_pos + move_offset, duration)
	tween.tween_property(self, "position", start_pos, duration)
