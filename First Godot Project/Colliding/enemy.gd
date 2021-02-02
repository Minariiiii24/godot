
extends Area2D


func onEnemybodyenter( body ):
	if body.getname() == "Player":
		body.kill()


