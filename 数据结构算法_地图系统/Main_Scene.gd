extends Node2D
var ced
var	square : Array
var nodes
var sides
var father_of_node
var father_of_side



func _ready() -> void:
	get_data()
	init_square()
	put_square()
	floyd()
	
	for x in range(nodes.size()):
		for y in range(nodes.size()):
			print(square[x][y])


func get_data():
	father_of_node = get_node("Father_of_node")
	father_of_side = get_node("Father_of_side")
	nodes = father_of_node.get_children()
	sides = father_of_side.get_children()
	print(nodes[0].name_of_building)

	

func init_square():
	#此处是该二维数组的初始化函数，两个range框里面决定了二维数组的初始化大小
	square = []
	for x in range(nodes.size()):
		square.append([])
		for y in range(nodes.size()):
			square[x].append(0)

func put_square():
	for x in range(sides.size()):
		square[sides[x].start] [sides[x].end] = sides[x].length
		square[sides[x].end] [sides[x].start] = sides[x].length
	for x in range(sides.size()):
		print(square[sides[x].start] [sides[x].end]+square[sides[x].start] [sides[x].end])

func floyd():
	for x in range(nodes.size()):
		for y in range(nodes.size()):
			for z in range(nodes.size()):
				if square[x][y] > square[x][z]+square[z][y] :
					square[x][y] = square[x][z]+square[z][y]
				
			

