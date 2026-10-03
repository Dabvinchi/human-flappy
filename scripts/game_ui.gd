extends CanvasLayer

@onready var game_over_panel = $GameOverPanel
@onready var pause_panel = $PausePanel

func _ready() -> void:
	game_over_panel.visible = false
	pause_panel.visible = false


func show_game_over() -> void:
	game_over_panel.visible = true


func _on_player_game_over_triggered() -> void:
	show_game_over()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_pause_button_pressed() -> void:
	pause_panel.visible = true
	get_tree().paused = true


func _on_resume_button_pressed() -> void:
	pause_panel.visible = false
	get_tree().paused = false


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
