extends Node

var highest_score: int = 0
var STATS_FILEPATH: String = "user://savegame.save"

func _ready():
	if not FileAccess.file_exists(STATS_FILEPATH):
		return

	var save_file = FileAccess.open(STATS_FILEPATH, FileAccess.READ)
	highest_score = int(save_file.get_line())

func save_highest_score(new_score: int):
	highest_score = new_score
	var save_file = FileAccess.open(STATS_FILEPATH, FileAccess.WRITE)
	save_file.store_line(str(highest_score))
