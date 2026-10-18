extends Area2D

@export var speed: float = 150.0

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent is PathFollow2D:
		parent.progress += speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var main_node = get_tree().current_scene
		if main_node:
			var node_tempo = main_node.get_node_or_null("Tempo")
			var timer = node_tempo.get_node_or_null("Timer") if node_tempo else null
			var tela_final = main_node.get_node_or_null("Final")
			
			if timer and not timer.is_stopped() and timer.time_left > 0:
				timer.stop()
			
			if body.has_method("blink_and_vanish"):
				await body.blink_and_vanish()
			
			if tela_final:
				tela_final.mostrar_final("Game Over", "Voce foi atingido pela esfera adversaria!", "Tentar Novamente")
