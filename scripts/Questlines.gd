extends Node

@export var questline_number: int = 0

var quest_database = {
	0:{
		"QuestName": "MALIGAYANG PAGDATING",
		"QuestDesc": "Narito ka na sa libro na'to! Makipag usap sa iyong lola na si Lola Nita!",
		"QuestImage": preload("res://textures/characterports/Lola Nita.png")
	},
	1:{
		"QuestName": "KAUSAPIN SI BINIBINING STACEY",
		"QuestDesc": "Ngayo'y alam mo na kung paano gumalaw, alamin na'tin at kausapin si Binibining Stacey! Nasaan ba siya?",
		"QuestImage": preload("res://textures/characterports/Stacey.png")
	},
	2:{
		"QuestName": "BAKA MAY ALAM ANG IBA",
		"QuestDesc": "Nakausap mo na ang paru-parong si Binibining Stacey! Ngayo'y magtanong ka kung sino ang may natatanging alam sa panulat! Maaaring nasa dinaraanan niya sa isang mababaw na tubigan?",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	3:{
		"QuestName": "ALAM PALA NG PALAKA",
		"QuestDesc": "Sabi niya'y tumungo sa tabing nayon ng kagubatang ito. At hahanapin ang isang babae! Sino kaya siya?",
		"QuestImage": preload("res://textures/characterports/Reggie.png")
	},
	4:{
		"QuestName": "ANG ASAWA KO AY ISANG ARKEOLOGO",
		"QuestDesc": "Ang asawa ni Ate Valerie ay isang Arkeologo! Ngunit nasaan siya?",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	5:{
		"QuestName": "ANG GABAY NI GINOONG HAROLD",
		"QuestDesc": "Ang sabi niya ay mayroong butas sa bukirin, tabi ng nayon. Ngunit saan?",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	6:{
		"QuestName": "KAY LAKI NG KWEBA",
		"QuestDesc": "Tignan pang maigi ang kweba kung ano ang natatago nitong ganda!",
		"QuestImage": preload("res://textures/characterports/Reggie.png")
	},
	7:{
		"QuestName": "MGA LABI NG NAKARAANG KAALAMAN",
		"QuestDesc": "Tila bago sa paningin lahat ito! Ating balikan si Kuya Harold!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	8:{
		"QuestName": "NASAAN ANG ESPERA",
		"QuestDesc": "Hanapin daw ang espera! Ngunit ano ito at nasaan? Ang sabi ay nasa Kagubatan!",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	9:{
		"QuestName": "DALHIN ANG ESPERA",
		"QuestDesc": "Dalhin ang espera kay Kuya Harold!",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	10:{
		"QuestName": "ESPERA PARA SA BATHALA NG KAALAMAN",
		"QuestDesc": "Dalhin ang espera sa istatwa ng Bathala ng Kaalaman!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	11:{
		"QuestName": "ANG ABAKADA NG BAGAY",
		"QuestDesc": "Hanapin LAHAT ng mga bawat bagay na maaaring dalhin sa Bathala ng Kaalaman!",
		"QuestImage": preload("res://textures/characterports/Bathalang Eyre.png")
	},
	12:{
		"QuestName": "ANG PANULAT",
		"QuestDesc": "Pumunta kay Binibining Stacey upang ibigay ang Panulat!",
		"QuestImage": preload("res://textures/characterports/Stacey.png")
	},
	13:{
		"QuestName": "SAGLIT LANG NASAAN ANG INGAY",
		"QuestDesc": "Hanapin ang ingay na iyon! Napakalakas at tila nasa kailaliman!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	14:{
		"QuestName": "GALING PALA SA IBABA",
		"QuestDesc": "Dinig na na'tin ang ingay! Hanapin siya!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	15:{
		"QuestName": "SI DANNY AT ANG KANYANG HILING",
		"QuestDesc": "Sumgaw si Danny dahil hindi niya mahanap ang kuwintas ng kaniyang kaibigan na si Merry! Ang sabi, si Merry ay nasa Ilog Hange!",
		"QuestImage": preload("res://textures/characterports/Danny.png")
	},
	16:{
		"QuestName": "ANG MAKULAY NA PALAISIPAN",
		"QuestDesc": "Tila ang bulwagang ito ay mayroong kahong may pazel! Buksan na’tin, alamin ang pazel at tignan ang laman!",
		"QuestImage": preload("res://textures/characterports/Danny.png")
	},
	17:{
		"QuestName": "IBALIK ANG KUWINTAS NG SIRENA",
		"QuestDesc": "Ang laman ng kahon ay kuwintas ni Merry! Tama nga ang namumuno ng nayon! Tinago nila ito sa kadahilanang baka mawala!",
		"QuestImage": preload("res://textures/characterports/Merry.png")
	},
	18:{
		"QuestName": "TAPOS NA SIGURO",
		"QuestDesc": "Bumalik kay Lola Nita upang bumalik sa tunay na mundo! Pumunta sa kagubatan.",
		"QuestImage": preload("res://textures/characterports/Lola Nita.png")
	},
	19:{
		"QuestName": "MERON NA NAMAN",
		"QuestDesc": "Mukhang hindi ka makakabalik ulit ah? Ang sabi ng Bathala ay si MatMat ay nasa sakahan!",
		"QuestImage": preload("res://textures/characterports/MatMat.png")
	},
	20:{
		"QuestName": "ANG KAGUSTUHAN NI MATMAT",
		"QuestDesc": "Tila si Mat-mat ay hindi marunong bumili! Sa madaling salita, hindi niya alam ang matematika! Maaari natin siyang tulungan sa pagtanong kay Ate Valerie kung ano ang mga presyo nito!",
		"QuestImage": preload("res://textures/characterports/MatMat.png")
	},
	21:{
		"QuestName": "MAGKANO ANG PERA NA AABUTIN",
		"QuestDesc": "Natanong na kay Ate Valerie ang mga presyo! Ngayon, kausapin si Mat-mat kung magkano ang kaniyang dala!",
		"QuestImage": preload("res://textures/characterports/Valerie.png")
	},
	22:{
		"QuestName": "ANG PLANO AT PAGDIRIWANG",
		"QuestDesc": "Ngayon, kausapin si Ate Valerie upang bumili! At ngayon ay pinasuyo sa’yo ni Mat-mat ang bilihin at ikaw na mismo ang gagawa!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	23:{
		"QuestName": "TAPOS NA LAHAT SA WAKAS",
		"QuestDesc": "Bumalik kay Lola Nita! Alamin kung ano ang natutunan sa lahat-lahat ng iyong mga nalaman!",
		"QuestImage": preload("res://textures/characterports/Lola Nita.png")
	},

}

func updateQuest():
	questline_number += 1
