extends Area2D

signal on_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	SignalManager.on_level_changed.emit()
	SignalManager.player_hit.emit()
#	hide()
#	on_entered.emit()
#	$CollisionShape2D.set_deferred("disabled", true)
