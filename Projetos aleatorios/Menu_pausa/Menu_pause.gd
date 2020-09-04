extends Control

var scene_path_sair
var scene_change
var menu_pause_active = false
var menu_2_active = false
var player
var cam

func _ready():
	cam = get_parent().get_node("target")
	player = get_parent().get_node("Player_v4")
	var option_sombra = get_node("Menu_2/sombra/OptionButton")
	#for button in $Menu_1/buttons.get_children():
		#button.connect("pressed", self, "_on_Button_pressed", "res://Menu_pausa/teste.tscn")
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("menu_pause"):
		if menu_pause_active:
			player.block_moviments(true)
			cam.block_cam(true)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			menu_pause_active = false
			menu_2_active = false
			$Menu_2.hide()
			hide()
			
		elif !menu_pause_active:
			player.block_moviments(false)
			cam.block_cam(false)
			menu_pause_active = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			show()
		
func _on_Button_sair_pressed():
	scene_change = "res://Menu_pausa/teste.tscn"
	$FadeIn.show()
	$FadeIn.fade_in()
	

func _on_Button_opcoes_pressed():
	if menu_2_active:
		menu_2_active = false
		$Menu_2.hide()
	elif !menu_2_active:
		menu_2_active = true
		$Menu_2.show()


func _on_Button_continuar_pressed():
	menu_pause_active = false
	menu_2_active = false
	#player.block_moviments(true)
	cam.block_cam(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Menu_2.hide()
	hide()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_change)




func _on_Button_aplicar_pressed():
	var sun = get_tree().get_root().get_node_or_null("Map_limpo/Sol")
	var option_sombra = get_node("Menu_2/sombra/OptionButton").selected
	Gamestate.type_shadow_mode = option_sombra
	print(sun)
	sun.set_shadow_mode(option_sombra)
	pass
