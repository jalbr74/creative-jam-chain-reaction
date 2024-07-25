extends Node2D

enum WorldState {
    Idle, PlacingDomino, MovingBall
}

var state = WorldState.Idle
var dominoBeingPlaced: Sprite2D = null
var fakeDominoScene = preload("res://Scenes/FakeDomino.tscn")
var realDominoScene = preload("res://Scenes/Domino.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if state == WorldState.PlacingDomino:
        dominoBeingPlaced.position = get_global_mouse_position()
    
func _on_button_button_down():   
    if state == WorldState.Idle:
        state = WorldState.PlacingDomino
        dominoBeingPlaced = fakeDominoScene.instantiate()
        dominoBeingPlaced.position = get_global_mouse_position()
        add_child(dominoBeingPlaced)

func _on_button_button_up():
    if state == WorldState.PlacingDomino:
        state = WorldState.Idle
        
        var newDomino: RigidBody2D = realDominoScene.instantiate()
        newDomino.position = dominoBeingPlaced.position
        add_child(newDomino)
        
        dominoBeingPlaced.queue_free()
        dominoBeingPlaced = null

func _on_domino_reset_pressed():
    pass # Replace with function body.
