extends Light2D

onready var lightLevel : int = 3
onready var e = energy
onready var rH = range_height

func _input(event) -> void:
	var mousePos := Vector2()
	# Call only when being clicked or moved
	if event is InputEventMouseMotion or InputEventMouseButton:
		mousePos = event.position
	position = mousePos


func _on_LevelHSlider_value_changed(value) -> void:
	lightLevel = value
	set_YellowLight_properties(lightLevel)


func set_YellowLight_properties(thisLevel) -> void:
	if thisLevel == 3:
		e = 0.65
		rH = 200
	elif thisLevel == 2:
		e = 8
		rH = 50
	else:
		e = 16
		rH = 0
