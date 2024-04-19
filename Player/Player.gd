extends CharacterBody2D


const S = 300.0
const JUMP_VELOCITY = -400.0
func _ready():
	pass

func _physics_process(_delta):
	var r = global_rotation
	var direction_1 = Input.get_axis("ui_left", "ui_right")
	if direction_1:
		velocity.x= cos(r)*S*direction_1
		velocity.y= sin(r)*S*direction_1
	var direction_2 = Input.get_axis("ui_up", "ui_down")
	if direction_2:
		velocity.x=-sin(r)*S*direction_2
		velocity.y= cos(r)*S*direction_2
	if !direction_1 && !direction_2:
		velocity.x=0
		velocity.y=0
	move_and_slide()
