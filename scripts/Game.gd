extends Node2D


onready var enemy_scene = preload("res://scenes/Enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	pass # Replace with function body.

func spawn():
	var enemy = enemy_scene.instance()
	add_child(enemy)
	enemy.position.x = rand_range(0, 1024)
	enemy.position.y = rand_range(0, 600)

func reset():
	get_tree().reload_current_scene()

