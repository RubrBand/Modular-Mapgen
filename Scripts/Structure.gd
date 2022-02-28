extends Node

var cache_dict
var cached = false
var forward = false

class Map2D:
	var width:int
	var height:int
	var map:Array

func init():
	if cached:
		cache_dict = {}
	

func generate(_seed:int, width:int, height:int):
	var map = []
	map.resize(width*height)
	#fill map and adhesive
	return map

func get_tile(coord_x:int, coord_y:int, _seed:int, width:int, height:int):
	if cached:
		var _ckey = str(_seed)+"/"+str(width)+"/"+str(height)
		if !cache_dict.has(_ckey):
			cache_dict[_ckey] = generate(_seed, width, height)
		return cache_dict[_ckey][coord_x+coord_y*height]
	else: 
		return gen_tile(coord_x, coord_y, _seed, width, height)

func gen_tile(coord_x:int, coord_y:int, _seed:int, width:int, height:int):
	pass #your function here

func copy_tilemap(map:Map2D, coord_x:int, coord_y:int, tilemap: Map2D):
	for i in range(0, tilemap.width):
		for j in range(0, tilemap.height):
			map.map[i+coord_x+map.width*(j+coord_y)] = tilemap.map[i+j*tilemap.width]

func apply(bottile, toptile, adhesive):
	return bottile + (toptile-bottile)*(bottile==adhesive||adhesive==-1)
