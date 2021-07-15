extends WorldEnvironment

onready var vfxLevel : int = 3
onready var e = environment


func _on_LevelHSlider_value_changed(value) -> void:
	vfxLevel = value
	set_WorldEnvironment_properties(vfxLevel)


func set_WorldEnvironment_properties(thisLevel) -> void:
	if thisLevel == 3:
		# Tonemap
		e.tonemap_exposure = 1.69

		# Glow
		e.glow_enabled = true
		e.glow_intensity = 0.7
		e.glow_strength = 1.08
		e.glow_bloom = 0.29
		e.glow_blend_mode = Environment.GLOW_BLEND_MODE_SCREEN
		e.glow_bicubic_upscale = true

		# Adjustments
		e.adjustment_enabled = true

	elif thisLevel == 2:
		# Tonemap
		e.tonemap_exposure = 1

		# Glow
		e.glow_enabled = true
		e.glow_intensity = 0.5
		e.glow_strength = 1.04
		e.glow_bloom = 0.15
		e.glow_blend_mode = Environment.GLOW_BLEND_MODE_SCREEN
		e.glow_bicubic_upscale = false

		# Adjustments
		e.adjustment_enabled = true

	else:
		# Tonemap
		e.tonemap_exposure = 1

		# Glow
		e.glow_enabled = false
		e.glow_intensity = 0.5
		e.glow_strength = 1
		e.glow_bloom = 0
		e.glow_blend_mode = Environment.GLOW_BLEND_MODE_SOFTLIGHT
		e.glow_bicubic_upscale = false

		# Adjustments
		e.adjustment_enabled = false
