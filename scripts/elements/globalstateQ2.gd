extends Node

var is_merrychest_opened: bool = false

var is_letter_introduced: bool = false

var is_letter_given: bool = false

var is_matmat_convinced: bool = false

signal showup
var is_on = false

func signalshowup(boolean):
	showup.emit(boolean)
