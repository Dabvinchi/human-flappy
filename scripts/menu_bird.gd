extends AnimatedSprite2D

@export var fly_speed: float = 120.0
@export var loop_delay: float = 2.0

var waiting: bool = false
var delay_timer: float = 0.0

func _ready() -> void:
	play("default")


func _process(delta: float) -> void:
	if waiting:
		delay_timer -= delta

		if delay_timer <= 0.0:
			waiting = false
			position.x = -100
			play("default")

		return

	position.x += fly_speed * delta

	if position.x > 1380:
		waiting = true
		delay_timer = loop_delay
		stop()
