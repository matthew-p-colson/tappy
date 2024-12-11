extends Node2D

class_name Pipes

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)

func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	check_off_screen()

func _physics_process(delta: float) -> void:
	pass
	
func check_off_screen() -> void:
	if visible_on_screen_notifier_2d.global_position.x < get_viewport_rect().position.x:
		queue_free()
		
func _on_plane_died() -> void:
	set_process(false)		


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
	#if body.is_in_group(GameManager.GROUP_NAME):
	#	if body.has_method("die"):
	#		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		audio_stream_player_2d.play()
		ScoreManager.increment_score()
