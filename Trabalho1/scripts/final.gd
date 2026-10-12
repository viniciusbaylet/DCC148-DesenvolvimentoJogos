extends CanvasLayer

@onready var reason_title: Label = $ColorRect/VBoxContainer/Label
@onready var reason_label: Label = $ColorRect/VBoxContainer/Label2
@onready var restart_button: Button = $ColorRect/VBoxContainer/RestartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mostrar_final(titulo: String, motivo: String, texto_botao: String) -> void:
	reason_title.text = titulo
	reason_label.text = motivo
	restart_button.text = texto_botao
	visible = true
	get_tree().paused = true
	
func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
