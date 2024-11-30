extends Control
signal goldnotify
signal newquest
signal newitem

func goldadded(gold):
	AUDIO.sfx("announce")
	Global.gold += gold
	goldnotify.emit(gold)

@warning_ignore("shadowed_variable_base_class")
func questnext(name):
	AUDIO.sfx("announce")
	newquest.emit(name)

func newitemAnnounce(item):
	AUDIO.sfx("announce")
	newitem.emit(item)
