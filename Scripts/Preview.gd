extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var structure_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init():
	var files = Utility.list_files_in_directory("res://Generator/Structures/")
	for file in files:
		if file.ends_with("mgs"):
			var scriptfile = File.new()
			scriptfile.open("res://Generator/Structures/"+file,scriptfile.READ)
			var script = GDScript.new()
			script.source_code = scriptfile.get_as_text()
			script.reload()
			scriptfile.close()
			var structureclass = script.new()
			structure_dict[file] = structureclass
			
			print("Script: "+file)
			structureclass.init()
	
	
	for i in range(-10,10):
		for j in range(-10,10):
			get_tile(i,j)

func _process(delta):
	pass

func load_world():
	pass

func get_tile(coord_x:int, coord_y:int):
	$TileMap.set_cell(coord_x, coord_y, structure_dict["Checker.mgs"].get_tile(coord_x, coord_y,0,0,0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
