extends Node2D

const PIPES = preload("res://scenes/pipes/pipes.tscn")

@onready var spawn_upper_limit: Marker2D = $SpawnUpperLimit
@onready var spawn_lower_limit: Marker2D = $SpawnLowerLimit
@onready var spawn_timer: Timer = $SpawnTimer
@onready var pipes_container: Node = $PipesContainer

func _ready() -> void:
	ScoreManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
	_spawn_pipes()

func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	_spawn_pipes()
	
func _spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var y_position = randf_range(spawn_upper_limit.position.y, spawn_lower_limit.position.y)
	new_pipes.position = Vector2(spawn_lower_limit.position.x, y_position)
	pipes_container.add_child(new_pipes)	


func _on_plane_died() -> void:
	spawn_timer.stop()
