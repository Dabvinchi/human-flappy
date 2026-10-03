extends Node2D

@export var pipe_scene: PackedScene

@export var min_gap_y: float = 180.0
@export var max_gap_y: float = 500.0


func _ready() -> void:
	spawn_pipe()


func spawn_pipe() -> void:
	var pipe = pipe_scene.instantiate()

	add_child(pipe)

	var gap_y = randf_range(min_gap_y, max_gap_y)

	pipe.position = Vector2(1350, gap_y)


func _on_pipe_timer_timeout() -> void:
	spawn_pipe()


func stop_spawning() -> void:
	$PipeTimer.stop()


func stop_all_pipes() -> void:
	for pipe in get_children():
		if pipe.has_method("stop"):
			pipe.stop()
