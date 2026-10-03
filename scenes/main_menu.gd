extends Control

const SAVE_PATH := "user://save.cfg"

func _ready() -> void:
	load_best_score()


func load_best_score() -> void:
	var config = ConfigFile.new()

	if config.load(SAVE_PATH) == OK:
		var best_score = config.get_value("score", "best", 0)
		$BestScoreLabel.text = "Best Score: " + str(best_score)
	else:
		$BestScoreLabel.text = "Best Score: 0"


func _on_play_button_pressed() -> void:
	print("PLAY BUTTON PRESSED!")
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
