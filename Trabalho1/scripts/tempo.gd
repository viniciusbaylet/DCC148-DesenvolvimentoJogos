extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var label_tempo: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tempo_restante = ceil(timer.time_left)
	if timer.is_stopped() or timer.time_left <= 0:
		label_tempo.text = "Tempo: 0.0"
	else:
		label_tempo.text = "Tempo: " + str(tempo_restante)

func _on_timer_timeout() -> void:
	label_tempo.text = "Tempo: 0.0"
	var tela_final = get_parent().get_node("Final")
	if tela_final:
		tela_final.mostrar_final("Game Over", "O tempo acabou!", "Tentar Novamente")
