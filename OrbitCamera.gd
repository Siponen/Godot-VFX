extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rotateSpeed = 1
var rotateHelper

func _ready():
	rotateHelper = get_parent()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("moveLeft"):
		global_transform = global_transform.rotated(Vector3(0,1,0),rotateSpeed*delta)
		pass
	elif Input.is_action_pressed("moveRight"):
		global_transform = global_transform.rotated(Vector3(0,1,0),-rotateSpeed*delta)
		pass
	pass