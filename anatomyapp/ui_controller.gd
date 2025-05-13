extends CanvasLayer

@onready var animation_player = get_node("/root/Main/HandRigHolder/HandRig/AnimationPlayer")

func _ready():
	print("🎞 Available animations:", animation_player.get_animation_list())
	if animation_player:
		print("✅ AnimationPlayer connected:", animation_player.get_path())
	else:
		print("❌ AnimationPlayer not found")

	# Connect animation buttons
	$ButtonContainer/VBoxContainer/Flexion_Button.pressed.connect(_play_flexion)
	$ButtonContainer/VBoxContainer/Extension_Button.pressed.connect(_play_extension)
	$ButtonContainer/VBoxContainer/Abduction_Button.pressed.connect(_play_abduction)
	$ButtonContainer/VBoxContainer/Adduction_Button.pressed.connect(_play_adduction)
	$Return_Button.pressed.connect(_return_home)

	# Connect popup open button
	$Popup_Button.pressed.connect(_open_joint_popup)

	# Optional: Connect close button inside popup
	if $JointFactPopup.has_node("CloseButton"):
		$JointFactPopup/CloseButton.pressed.connect(_close_joint_popup)

func _play_flexion():
	animation_player.play("flexion")
	print("Flexion")

func _play_extension():
	animation_player.play("extension")

func _play_abduction():
	animation_player.play("abduction")

func _play_adduction():
	animation_player.play("adduction")

func _return_home():
	get_tree().change_scene_to_file("res://home_screen.tscn")

func _open_joint_popup():
	$JointFactPopup.popup_centered()

func _close_joint_popup():
	$JointFactPopup.hide()
