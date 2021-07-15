extends CPUParticles2D

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'splash_out':
		one_shot = false
		emitting = true
	elif anim_name == 'splash_in':
		one_shot = true
		emitting = false
