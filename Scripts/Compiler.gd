extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scripts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	compile()

func getallnodes(node):
	for N in node.get_children():
		compilestructure(N)
		if N.get_child_count() > 0:
			getallnodes(N)

func compile():
	getallnodes($Compile)
	$Preview.init()


func compilestructure(node:Node):
	var script = node.get_script()
	var node_name = node.name
	if scripts.find(node_name) == -1:
		scripts.append(node_name)
		var scripttext = script.source_code
		
		
		
		var scriptfile = File.new()
		scriptfile.open("res://Generator/Structures/"+node_name+".mgs",scriptfile.WRITE)
		scriptfile.store_string(scripttext)
		scriptfile.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
