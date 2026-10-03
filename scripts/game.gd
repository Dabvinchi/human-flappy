extends Node2D

var game_over: bool = false
var score: int = 0
var best_score: int = 0

@export var base_pipe_speed: float = 250.0
@export var pipe_speed_per_score: float = 10.0

const SAVE_PATH := "user://save.cfg"

func load_best_score() -> void:
	var config = ConfigFile.new()

	if config.load(SAVE_PATH) == OK:
		best_score = config.get_value("score", "best", 0)

	$GameUI/BestScoreLabel.text = "BEST SCORE: " + str(best_score)

func _ready() -> void:
	load_best_score()
	
func save_best_score() -> void:
	var config = ConfigFile.new()

	config.set_value("score", "best", best_score)
	config.save(SAVE_PATH)

func add_score() -> void:
	score += 1
	$ScoreSound.play()
	
	if score > best_score:
		best_score = score
		save_best_score()

	$GameUI/BestScoreLabel.text = "BEST SCORE: " + str(best_score)
	$GameUI/ScoreLabel.text = str(score)

func _on_player_game_over_triggered() -> void:
	game_over = true
	$GameOverSound.play()
	$PipeSpawner.stop_spawning()
	$PipeSpawner.stop_all_pipes()
