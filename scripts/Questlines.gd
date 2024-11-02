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
		"QuestDesc": "Hanapin daw ang espera! Ngunit ano ito at nasaan?",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	9:{
		"QuestName": "DALHIN ANG ESPERA",
		"QuestDesc": "Dalhin ang espera kay Kuya Harold!",
		"QuestImage": preload("res://textures/characterports/Harold.png")
	},
	10:{
		"QuestName": "ESPERA PARA SA ESPIRITU",
		"QuestDesc": "Dalhin ang espera sa istatwa ng Espiritu ng Kaalaman!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	11:{
		"QuestName": "ANG ABAKADA NG BAGAY",
		"QuestDesc": "Hanapin LAHAT ng mga bawat bagay na maaaring dalhin sa Espiritu ng Kaalaman!",
		"QuestImage": preload("res://textures/characterports/Lisa.png")
	},
	12:{
		"QuestName": "ANG PANULAT",
		"QuestDesc": "Pumunta kay Binibining Stacey upang ibigay ang Panulat!",
		"QuestImage": preload("res://textures/characterports/Stacey.png")
	},
	13:{
		"QuestName": "TAPOS NA ANG UNANG KABANATA",
		"QuestDesc": "Bumalik kay Lola Nita upang bumalik sa tunay na mundo!",
		"QuestImage": preload("res://textures/characterports/Lola Nita.png")
	}
	
}

func updateQuest():
	questline_number += 1
