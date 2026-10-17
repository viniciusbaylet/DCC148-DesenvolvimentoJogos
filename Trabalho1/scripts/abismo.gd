extends Area2D

var has_fallen: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if has_fallen:
		return
		
	if body.name == "Player":
		has_fallen = true
		
		var main_node = get_tree().current_scene
		if main_node:
			var node_tempo = main_node.get_node_or_null("Tempo")
			var timer = node_tempo.get_node_or_null("Timer") if node_tempo else null
			if timer and not timer.is_stopped():
				timer.stop()
				
			if body.has_method("blink_and_vanish"):
				await body.blink_and_vanish()
				
			var tela_final = main_node.get_node_or_null("Final")
			if tela_final:
				tela_final.mostrar_final("Game Over", "Voce caiu no abismo!", "Tentar Novamente")
