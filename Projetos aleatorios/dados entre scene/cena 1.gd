extends Control

var scene_change = "res://dados entre scene/cena 2.tscn"
func _ready():
	pass 
	
func _process(delta):
	if Input.is_action_just_pressed("direita"):
		
		Gamestate.players_ready.append(Gamestate.dado+1)
		print("cena 1", Gamestate.players_ready)
	if Input.is_action_just_pressed("frente"):
		get_tree().change_scene(scene_change)
	if Input.is_action_just_pressed("esquerda"):
		#get_tree().get_root().add_child(scene_change)
		#get_tree().change_scene(scene_change)
		pass
		
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 50)
	return my_random_number
