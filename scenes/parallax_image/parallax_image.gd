extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D

func _ready() -> void:
	var scale_factor = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	repeat_size.x = texture.get_width() * scale_factor
	SignalManager.on_plane_died.connect(_on_plane_died)
	
func _process(delta: float) -> void:
	screen_offset.x += delta * GameManager.SCROLL_SPEED	
	

func _on_plane_died() -> void:
	set_process(false)
