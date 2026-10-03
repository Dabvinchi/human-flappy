extends AnimatedSprite2D

@export var move_speed: float = 80.0
@export var bob_height: float = 3.0
@export var bob_speed: float = 2.0

var start_y: float
var moving_right: bool = true

func _ready() -> void:
	play("default")
	start_y = position.y

func _process(delta: float) -> void:
	# Move yacht
	if moving_right:
		position.x += move_speed * delta
	else:
		position.x -= move_speed * delta

	# Gentle bobbing
	position.y = start_y + sin(Time.get_ticks_msec() / 1000.0 * bob_speed) * bob_height

	# Right edge → turn around
	if moving_right and position.x > 1380:
		moving_right = false
		flip_h = true

	# Left edge → turn around
	elif not moving_right and position.x < -150:
		moving_right = true
		flip_h = false
