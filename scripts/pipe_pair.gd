extends Node2D

@export var speed: float = 250.0

var stopped: bool = false
var scored: bool = false

func _process(delta: float) -> void:
	if stopped:
		return

	var game = get_tree().current_scene
	var current_speed = game.base_pipe_speed + (game.score * game.pipe_speed_per_score)

	position.x -= current_speed * delta

	var player = get_tree().current_scene.get_node("Player")

	if not scored and position.x < player.position.x:
		scored = true

		if game.has_method("add_score"):
			game.add_score()

	if position.x < -150:
		queue_free()

func stop() -> void:
	stopped = true


func _on_score_area_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	if global_position.x >= body.global_position.x:
		return

	var game = get_tree().current_scene

	if game.has_method("add_score"):
		game.add_score()
