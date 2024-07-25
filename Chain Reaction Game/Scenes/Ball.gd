extends CharacterBody2D

enum BallState {
    Idle, MovedByUser
}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var state = BallState.Idle


func _physics_process(delta):
    if state == BallState.MovedByUser:
        var mousePosition = get_global_mouse_position()
        var direction = global_position.direction_to(mousePosition)
        velocity = direction * 100
        pass
    
    ## Add the gravity.
    #if not is_on_floor():
        #velocity.y += gravity * delta
#
    ## Handle jump.
    #if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        #velocity.y = JUMP_VELOCITY
#
    ## Get the input direction and handle the movement/deceleration.
    ## As good practice, you should replace UI actions with custom gameplay actions.
    #var direction = Input.get_axis("ui_left", "ui_right")
    #if direction:
        #velocity.x = direction * SPEED
    #else:
        #velocity.x = move_toward(velocity.x, 0, SPEED)
#
    #move_and_slide()


#func _on_button_button_down():
    #print("Touched the ball")
    #state = BallState.MovedByUser
#
#func _on_button_button_up():
    #print("Stopped touching the ball")
    #state = BallState.Idle

func _on_mouse_entered():
    print("Touched the ball")
    state = BallState.MovedByUser
