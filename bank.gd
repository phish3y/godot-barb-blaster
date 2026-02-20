extends MarginContainer
class_name Bank

@export var starting_gold: int = 150

@onready var label: Label = $Label

var gold: int:
	set(gold_in):
		if gold_in >= 0:
			gold = max(gold_in, 0)
			self.label.text = "Gold: " + str(gold)	

func _ready() -> void:
	self.gold = starting_gold
