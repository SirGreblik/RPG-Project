extends Camera2D
var z_max = 0.1
var z_min =3

# Called when the node enters the scene tree for the first time.
func _ready():
	set_ignore_rotation(false)
	set_limit(1000,1000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if Input.is_key_pressed(KEY_0):
		set_zoom(zoom/0.99)
	if Input.is_key_pressed(KEY_9):
		set_zoom(zoom/1.01)
	if zoom.x>z_min:
		zoom.x=z_min
		zoom.y=z_min
	if zoom.x<z_max:
		zoom.x=z_max
		zoom.y=z_max		
