extends CharacterBody2D

func _ready() -> void:
	$AnimatedSprite2D.play("fly")

signal game_over_triggered

var game_over: bool = false

@export_category("Flight Settings")

@export var gravity: float = 1200.0
@export var flap_strength: float = -450.0
@export var max_fall_speed: float = 700.0

func _input(event: InputEvent) -> void:
	if game_over:
		return

	if event is InputEventScreenTouch:
		if event.pressed:
			flap()

func _physics_process(delta: float) -> void:
	if game_over:
		return

	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_fall_speed)

	if Input.is_action_just_pressed("flap"):
		flap()

	move_and_slide()

	if get_slide_collision_count() > 0:
		game_over = true
		game_over_triggered.emit()


func flap() -> void:
	velocity.y = flap_strength
	$FlapSound.play()
