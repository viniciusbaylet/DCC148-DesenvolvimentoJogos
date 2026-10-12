extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var main_node = get_tree().current_scene
		
		if main_node:
			# Pega o nó CanvasLayer "Tempo" e depois pega o "Timer" que está dentro dele
			var node_tempo = main_node.get_node_or_null("Tempo")
			var timer = node_tempo.get_node_or_null("Timer") if node_tempo else null
			var tela_final = main_node.get_node_or_null("Final")
			
			if timer and not timer.is_stopped() and timer.time_left > 0:
				timer.stop()
				
				if tela_final:
					tela_final.mostrar_final("VITORIA!", "Você venceu, parabéns você conseguiu completar o percurso", "Recomeçar")
