extends Node3D


func _ready() -> void:
	$Objects/MovingPlatform/AnimationPlayer.play("Move")

func _on_area_3d_area_entered(area):
	print("A:" + str(area))
	if not area.get_parent() is SM64Mario:
		return
	
	var mario = area.get_parent() as SM64Mario
	if mario.action == SM64MarioAction.GROUND_POUND_LAND:
		%StompBlock.queue_free()

func _on_area_3d_body_entered(body):
	print("B:" + str(body))


func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("C:" + str(area))


func _on_PunchBlock_area_3d_area_entered(area):
	if not area.get_parent() is SM64Mario:
		return
	
	var mario = area.get_parent() as SM64Mario
	if mario.action == SM64MarioAction.MOVE_PUNCHING:
		%PunchBlock.queue_free()
