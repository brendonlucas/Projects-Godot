extends Node

var dado :int = 0
var players = {}
var players_ready = []

var type_shadow_mode = 0

# exp variaveis
var nivel : int
var exp_total : int
var exp_atual : int
var a = {'1': 1000,'2': 1500, '3': 2500,
 '4':3000,'5': 3500,'6': 4000,'7':5000,
'8':6000,'9':7000,'10':0}
var exp_active


func _ready():
	var nodess = get_tree().get_root().get_node_or_null("cena 1")
	print(nodess)
	pass

func add_exp(xp_value):
	#Salvar_BD: nivel/ exp total / exp restante / exp nivel atual
	if nivel < 10:
		exp_active = false
		var exp_prox_nivel : int = a[str(nivel)]
		var exp_restante = a[str(nivel)] - exp_atual
		
		if exp_restante < xp_value:
			print("entrou na sobra")
			var sobra_exp = xp_value - exp_restante
			var exp_usada = xp_value - sobra_exp
			exp_total += exp_usada
			exp_atual += exp_usada
			print(exp_usada)
			print(sobra_exp)
			
			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
			add_exp(sobra_exp)
		else:
			print("foi normal")
			exp_total += xp_value
			exp_atual += xp_value
			
			if exp_atual >= exp_prox_nivel and nivel < 10:
				nivel += 1
				exp_atual = 0
	
		exp_restante = a[str(nivel)] - exp_atual
		
		#label_exp_total.set_text(str(exp_total))
		#label_nivel.set_text(str(nivel))
		#label_exp_nivel_atual.set_text(str(exp_atual))
		#label_exp_restante.set_text(str(exp_restante))
	
	
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 300)
	return my_random_number
	
