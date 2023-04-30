extends Area2D

const HitEffect = preload("res://Assets/Effects/hit_effect.tscn")

@onready var timer = $Timer

signal invincibility_started
signal invincibility_ended

var invincible = false:
	set(value):
		invincible = value
		if invincible == true:
			emit_signal("invincibility_started")
			print("invincibility_started")
		else:
			emit_signal("invincibility_ended")
			print("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func _on_timer_timeout():
	self.invincible = false

func _on_invincibility_started():
	print("invincibility_started: setting monitoring to false..")
	set_deferred ("monitoring", false)

func _on_invincibility_ended():
	monitoring = true

func create_hit_effect():
	var effect = HitEffect.instantiate()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position
