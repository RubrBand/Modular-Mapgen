extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
static func div(var a : int, var b : int):
	if a<0:
		a = a - b+1
	return a/b

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true, true)

	while true:
		var file = dir.get_next()
		if file == "":
			break
		files.append(file)
	return files

func safe_load(path):
	var file = File.new()
	if file.file_exists(path):
		return load(path)
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
