extends CharacterBody2D

class_name Tappy

const GRAVITY: float = 1000.0
const POWER: float = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	velocity = Vector2(0, POWER)

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	_fly()
	move_and_slide()	
	
	if is_on_floor():
		die()
	
func _fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")	
		
func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	SignalManager.on_plane_died.emit()
	audio_stream_player.stop()
		
