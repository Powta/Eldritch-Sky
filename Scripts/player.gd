extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction:Vector2

#Boundaries
@export_category("Player Boundaries")
@export var minX:float
@export var maxX:float
@export var minY:float
@export var maxY:float

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	direction= Vector2(directionX,directionY)
	
	print(direction)
	if direction:
		velocity= direction * SPEED
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED),move_toward(velocity.x, 0, SPEED))
	
	checkBoundaries(direction)

	move_and_slide()

func checkBoundaries(dir:Vector2):
	if position.x<=minX:
		if dir.x<0:
			velocity.x=0
	if position.x>=maxX:
		if dir.x>0:
			velocity.x=0
	if position.y>=minY:
		if dir.y>0:
			velocity.y=0
	if position.y<=maxY:
		if dir.y<0:
			velocity.y=0
