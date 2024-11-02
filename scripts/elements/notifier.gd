extends Control
signal goldnotify
signal newquest
signal newitem

func goldadded(gold):
	Global.gold += gold
	goldnotify.emit(gold)

@warning_ignore("shadowed_variable_base_class")
func questnext(name):
	newquest.emit(name)

func newitemAnnounce(item):
	newitem.emit(item)
