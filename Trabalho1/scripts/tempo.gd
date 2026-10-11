extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var label_tempo: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tempo_restante = ceil(timer.time_left)
	label_tempo.text = "Tempo: " + str(tempo_restante)

func _on_timer_timeout() -> void:
	var game_over = get_parent().get_node("GameOver")
	if game_over:
		game_over.mostrar_game_over("O tempo acabou!")
