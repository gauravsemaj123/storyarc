extends Node

var gold = 300

var compute = 168

var valerie_shopDialog = {
	0:{
		"say": "Ayan ba gusto mo anak?"
	},
	1:{
		"say": "Pili ka lang!"
	},
	2:{
		"say": "Ay, masarap 'yan anak!"
	},
}

var shop = {
	0:{
		"Name": "Isaw",
		"Des": "Isang sikat na pagkaing kalye sa Pilipinas na binubuo ng inihaw na bituka ng manok o baboy.",
		"Cost": 50,
		"Icon": preload("res://inventorymain/inventory/itemlists/isaw.png"),
		"Count": 1
	},
	1: {
		"Name":"Halu Halo",
		"Des": "Isang sikat na panghimagas sa Pilipinas na binubuo ng yelong kinudkod, gatas na kondensada, at sari-saring sangkap.",
		"Cost": 50,
		"Icon": preload("res://inventorymain/inventory/itemlists/halohalo.png"),
		"Count": 1
	},
	2:{
		"Name": "Pastil",
		"Des": "Isang tradisyonal na pagkaing Pilipino na binubuo ng kanin at hinimay na karne o isda, balot sa dahon ng saging.",
		"Cost": 50,
		"Icon": preload("res://inventorymain/inventory/itemlists/pastil.png"),
		"Count": 1
	},
	3: {
		"Name": "Empanada",
		"Des": "Isang uri ng pinalamanang pastelerya na karaniwang hinuhurno o piniprito.",
		"Cost": 75,
		"Icon": preload("res://inventorymain/inventory/itemlists/empanada.png")
	},
	4: {
		"Name": "Niyog",
		"Des":  "Isang mahalagang puno sa Pilipinas na kilala bilang puno ng buhay.",
		"Cost": 75,
		"Icon": preload("res://inventorymain/inventory/itemlists/niyog.png"),
	},
}

var items = {
	0: {
		"Name": "Atis",
		"Des": "Isang matamis na prutas na may buto at berdeng balat.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/atis.png")
	},
	1: {
		"Name": "Empanada",
		"Des": "Isang uri ng pinalamanang pastelerya na karaniwang hinuhurno o piniprito.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/empanada.png")
	},
	2:{
		"Name": "Isaw",
		"Des": "Isang sikat na pagkaing kalye sa Pilipinas na binubuo ng inihaw na bituka ng manok o baboy.",
		"Cost": 100,
		"Icon": preload("res://inventorymain/inventory/itemlists/isaw.png")
	},
	3: {
		"Name": "Okra",
		"Des":  "Isang mahabang, payat, at berdeng gulay na kilala sa madulas na lamán at mabutóng loob.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/okra.png")
	},
	4:{
		"Name": "Ube",
		"Des": "Isang matamis na kamoteng kulay lila na kilala sa kanyang natatanging lasa at ginagamit sa iba't ibang uri ng mga panghimagas.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/ube.png")
	},
	5: {
		"Name": "Bayabas",
		"Des":  "Isang maliit na puno na may bilugang bunga, mabuto, at nakakain.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/bayabas.png")
	},
	6: {
		"Name": "Kamatis",
		"Des": "Isang masustansyang gulay na mayaman sa potassium, vitamin C, at lycopene.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/kamatis.png")
	},
	7: {
		"Name": "Duhat" ,
		"Des": "Isang malakilaking punongkahoy na may bungang habilog."  ,
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/duhat.png")
	},
	8: {
		"Name": "Guyabano",
		"Des":  "Isang prutas na may bilugang hugis at matinik na balat.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/guyabano.png")
	},
	9: {
		"Name":"Halu Halo",
		"Des": "Isang sikat na panghimagas sa Pilipinas na binubuo ng yelong kinudkod, gatas na kondensada, at sari-saring sangkap.",
		"Cost": 50,
		"Icon": preload("res://inventorymain/inventory/itemlists/halohalo.png")
	},
	10: {
		"Name": "Lanzones",
		"Des":  "Isang tropikal na prutas na kilala sa kanyang matamis at maasim na lasa.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/lanzones.png")
	},
	11: {
		"Name": "Mangga",
		"Des": "Isang makatas at matamis na prutas, tanyag ito sa Pilipinas lalo na tuwing tag-init.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/mangga.png")
	},
	12: {
		"Name": "Niyog",
		"Des":  "Isang mahalagang puno sa Pilipinas na kilala bilang puno ng buhay.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/niyog.png")
	},
	13:{
		"Name":" Pastil",
		"Des": "Isang tradisyonal na pagkaing Pilipino na binubuo ng kanin at hinimay na karne o isda, balot sa dahon ng saging.",
		"Cost": 100,
		"Icon": preload("res://inventorymain/inventory/itemlists/pastil.png")
	},
	14:{
		"Name": "Rambutan" ,
		"Des": "Isang tropikal na prutas na may makapal at mabalahibong balat.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/rambutan.png")
	},
	15: {
		"Name": "Santol" ,
		"Des":  "Isang tropikal na prutas na may makapal at mabulak na balat at malambot na laman.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/santol.png")
	},
	16: {
		"Name": "Talong" ,
		"Des": "Isang uri ng gulay na mahaba, karaniwang lila ang balat, at ginagamit sa iba't ibang lutuin.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/talong.png")
	},
	17: {
		"Name":  "Wansoy"  ,
		"Des":  "Isang yerba na maaaring kainin nang hilaw ang dahon at ginagamit bilang pampalasa sa iba't ibang putahe.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/wansoy.png")
	},
	18: {
		"Name": "Yangka" ,
		"Des": "Isang malaki at berdeng prutas na may matamis na laman.",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/yangka.png")
	},
	19:{
		"Name": "Panulat"  ,
		"Des": "Simpleng panulat na galing kay Binibining Stacey, ngunit nagdadala ito ng malaking hiwaga!",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/panulat.png")
	},
	20:{
		"Name": "Papel" ,
		"Des": "Naglalaman ito ng mga bibilihin ni MatMat!",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/listahan.png")
	},
	21: {
		"Name": "Espera" ,
		"Des": "Tila misteryoso...",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/sphere.png")
	},
	22:{
		"Name": "Papel" ,
		"Des":  "Naglalaman ito ng mga bibilihin ni MatMat! At meron ding nakasulat na aabuting gastos na halagang " + str(compute) + "! Abutin kay MatMat!",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/listahan.png")
	},
	23:{
		"Name": "Liham",
		"Des":  "Ang liham ay isang pribadong mensahe na kalimitang binibigay ng mga mensahero. Huwag basahin ang mga ito habang naka-selyo!",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/listahan.png")
	},
	24: {
		"Name": "Kuwintas" ,
		"Des":  "Ang ganda...",
		"Cost": 0,
		"Icon": preload("res://inventorymain/inventory/itemlists/kwintas.png")
	},
	25: {
		"Name": "Fortune Cookie #2" ,
		"Des":  "Isang maliit na biskwit na may nakatagong hula sa loob. Kolektahin ang mga 'to!",
		"Cost": 0,
		"Icon": null
	}

}

var inventory = { 
}
