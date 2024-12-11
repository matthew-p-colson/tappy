extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN = preload("res://scenes/main/main.tscn")
const SIMPLE_TRANSITION: PackedScene = preload("res://scenes/simple_transition/simple_transition.tscn")
const COMPLEX_TRANSITION = preload("res://scenes/complex_transition/complex_transition.tscn")

const SCROLL_SPEED: float = 120
const GROUP_NAME: String = "Plane"

var next_scene: PackedScene

func load_next_scene(ns: PackedScene) -> void:
	next_scene = ns
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	var complex_transition = COMPLEX_TRANSITION.instantiate()
	add_child(complex_transition)

func load_game_scene() -> void:
	load_next_scene(GAME)
	
func load_main_scene() -> void:
	load_next_scene(MAIN)	
