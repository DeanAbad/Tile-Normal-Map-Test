extends Node2D

onready var e = $WorldEnvironment.environment
onready var visiblePanel : bool = false
onready var viewPanel : bool = false

func _ready() -> void:
	set_TitleSplash_AnimationPlayer(visiblePanel)
	$UIPanel/TogglePanelButton.set_text('<<')


func set_TitleSplash_AnimationPlayer(thisVisible) -> void:
	if thisVisible == false:
		# Tonemap
		e.tonemap_exposure = 1.69

		# Glow
		e.glow_enabled = true
		e.glow_intensity = 1
		e.glow_strength = 1
		e.glow_bloom = 0.17
		e.glow_blend_mode = Environment.GLOW_BLEND_MODE_SCREEN
		e.glow_bicubic_upscale = true

		# Adjustments
		e.adjustment_enabled = true

		$AnimationPlayer.play("splash_out")

	else:
		$AnimationPlayer.play("splash_in")

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


func _on_TogglePanelButton_pressed() -> void:
	viewPanel = !viewPanel
	if viewPanel == true:
		$AnimationPlayer.play("slide_out")
	else:
		$AnimationPlayer.play("slide_in")


func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	if anim_name == 'splash_out':
		set_TitleSplash_AnimationPlayer(true)
	elif anim_name == 'splash_in':
		$UIPanel.visible = true

	if anim_name == 'slide_out':
		$UIPanel/TogglePanelButton.set_text('>>')
	elif anim_name == 'slide_in':
		$UIPanel/TogglePanelButton.set_text('<<')


func _on_GithubRichTextLabel_meta_clicked(meta) -> void:
# warning-ignore:return_value_discarded
	OS.shell_open(meta)


func _on_TwitterRichTextLabel_meta_clicked(meta) -> void:
# warning-ignore:return_value_discarded
	OS.shell_open(meta)


func _on_YouTubeRichTextLabel_meta_clicked(meta) -> void:
# warning-ignore:return_value_discarded
	OS.shell_open(meta)


func _on_itchRichTextLabel_meta_clicked(meta) -> void:
	# warning-ignore:return_value_discarded
	OS.shell_open(meta)


func _on_gotmRichTextLabel_meta_clicked(meta) -> void:
	# warning-ignore:return_value_discarded
	OS.shell_open(meta)
