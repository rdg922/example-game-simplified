extends KinematicBody2D

onready var player = get_node("../Player")

const SPEED = 250
var follow_time = rand_range(5, 7) # the enemy will follow for between 5 to 7 seconds and spawn a new one before dissapearing

func _process(delta):

	look_at(player.position)
	var motion = (player.position - position).normalized() * SPEED

	follow_time -= delta
	if follow_time <= 0:
		get_parent().call("spawn")
		queue_free()

	move_and_slide(motion)


# Look up godot signals
func _on_Area2D_body_entered(body:Node):
	if body.is_in_group("Player"): # Make sure to add your player to the group 'Player'. Look up Godot Groups if you don't know what that is
		get_parent().call("reset")

	pass # Replace with function body.
