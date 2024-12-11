extends Control

@onready var game_over_label: Label = $GameOverLabel
@onready var space_label: Label = $SpaceLabel
@onready var label_timer: Timer = $LabelTimer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()


func _on_label_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()	
	
func on_plane_died() -> void:
	show()
	label_timer.start()
	audio_stream_player.play()
	ScoreManager.save_high_score_to_file()	
