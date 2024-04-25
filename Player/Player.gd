extends CharacterBody2D
const S = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	pass

func _physics_process(_delta):
	var r = global_rotation
	var x = Input.get_axis("ui_left", "ui_right")
	var y = Input.get_axis("ui_up", "ui_down")	
	if x || y:
		velocity.x= cos(r)*S*x + -sin(r)*S*y
		velocity.y= cos(r)*S*y + sin(r)*S*x
		if x && y:
			velocity.x *= 0.71
			velocity.y *= 0.71
	else:
		velocity.x=0
		velocity.y=0
	move_and_slide()
