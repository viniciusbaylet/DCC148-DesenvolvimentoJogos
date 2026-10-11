extends CanvasLayer

@onready var reason_label: Label = $ColorRect/VBoxContainer/Label2
@onready var restart_button: Button = $ColorRect/VBoxContainer/RestartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	restart_button.pressed.connect(_on_restart_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mostrar_game_over(motivo: String) -> void:
	reason_label.text = motivo
	visible = true
	get_tree().paused = true 
	
func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
