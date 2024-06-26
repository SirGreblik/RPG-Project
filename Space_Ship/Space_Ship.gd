extends CharacterBody2D
const S = 600
const A = 2
const R = 0.02
func _ready():
	pass

func _physics_process(delta):
	var direction_1 = 0
	var direction_2 = 0
	if Input.is_key_pressed(KEY_W):
		direction_1 = 2
	if Input.is_key_pressed(KEY_S):
		direction_1 = -2
	if Input.is_key_pressed(KEY_A):
		direction_2 = -2
	if Input.is_key_pressed(KEY_D):
		direction_2 = 2
	if direction_1 != 0:
		velocity.x += sin(rotation)*direction_1*A
		velocity.y += -cos(rotation)*direction_1*A
	if Input.is_key_pressed(KEY_SPACE):
		velocity.x = move_toward(velocity.x, 0, A)
		velocity.y = move_toward(velocity.y, 0, A)
	if direction_2 != 0:
		rotate(direction_2*R/5)
	if sqrt(velocity.x*velocity.x + velocity.y*velocity.y)>S:
		velocity.x=sin(rotation)*S*direction_1
		velocity.y=-cos(rotation)*S*direction_1
	move_and_slide()
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)
