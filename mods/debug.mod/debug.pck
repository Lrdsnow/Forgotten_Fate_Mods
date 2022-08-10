GDPC                  p                                                                            res://.godot/uid_cache.bin  P!      +       ��%Mb~�ቩrT��6S       res://mods/debug/debug.gd           �      �`x�$,�I��L$�6$       res://mods/debug/debug.tscn �      g      ���pB�݆.��q�/       res://project.binary�!      S      ��6ۛ%��z(*eL�s    ע\extends CanvasLayer

var debug_open = false
signal cITEM

# Called when the node enters the scene tree for the first time.
func _ready():
	resize()
	cITEM.connect(Global.update_items)
	for i in Global.all_items:
		$debug_panel/vbox/items_opt.add_item(i, Global.all_items.find(i))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug"):
		if ! debug_open:
			if Global.ingame:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				Global.paused=true
				Global.can_move=false
			update_vars()
			$anim.play("open")
			debug_open = true
		else:
			if Global.ingame:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				Global.paused=false
				Global.can_move=true
			$anim.play_backwards("open")
			debug_open = false

func resize():
	$debug_panel.size.y = get_viewport().size.y
	$debug_panel/vbox.size.y = get_viewport().size.y

func update_vars():
	if Global.ingame:
		$debug_panel/vbox/items.show()
		$debug_panel/vbox/items_opt.show()
		$debug_panel/vbox/fov.show()
		$debug_panel/vbox/fov_slider.show()
		$debug_panel/vbox/ammo.show()
		$debug_panel/vbox/ammo_in.show()
		$debug_panel/vbox/health.show()
		$debug_panel/vbox/health_slider.show()
		$debug_panel/vbox/stam.show()
		$debug_panel/vbox/stam_slider.show()
		$debug_panel/vbox/pwr.show()
		$debug_panel/vbox/pwr_slider.show()
		$debug_panel/vbox/br.show()
		$debug_panel/vbox/br_slider.show()
		$debug_panel/vbox/bools.hide()
		$debug_panel/vbox/truefate.hide()
		$debug_panel/vbox/fov_slider.value = get_node("/root/World/Player/collision/neck/head/player_camera").fov
		$debug_panel/vbox/items_opt.selected = Global.all_items.find(Global.player_held_item)
		$debug_panel/vbox/ammo_in.value = Global.ammo
		$debug_panel/vbox/health_slider.value = Global.health
		$debug_panel/vbox/stam_slider.value = Global.stamina
		$debug_panel/vbox/pwr_slider.value = Global.power
	else:
		$debug_panel/vbox/items.hide()
		$debug_panel/vbox/items_opt.hide()
		$debug_panel/vbox/fov.hide()
		$debug_panel/vbox/fov_slider.hide()
		$debug_panel/vbox/ammo.hide()
		$debug_panel/vbox/ammo_in.hide()
		$debug_panel/vbox/health.hide()
		$debug_panel/vbox/health_slider.hide()
		$debug_panel/vbox/stam.hide()
		$debug_panel/vbox/stam_slider.hide()
		$debug_panel/vbox/pwr.hide()
		$debug_panel/vbox/pwr_slider.hide()
		$debug_panel/vbox/br.hide()
		$debug_panel/vbox/br_slider.hide()
		$debug_panel/vbox/bools.show()
		$debug_panel/vbox/truefate.show()


func _on_items_opt_pressed():
	Global.player_held_item = $debug_panel/vbox/items_opt.get_item_text($debug_panel/vbox/items_opt.selected)


func _on_health_slider_value_changed(value):
	Global.health = value


func _on_stam_slider_value_changed(value):
	Global.stamina = value


func _on_pwr_slider_value_changed(value):
	Global.power = value


func _on_fov_slider_value_changed(value):
	get_node("/root/World/Player/collision/neck/head/player_camera").fov = value


func _on_br_slider_value_changed(value):
	Global.env.adjustment_brightness = value
'��[gd_scene load_steps=5 format=3 uid="uid://bvtm2y4q5kpn4"]

[ext_resource type="Script" path="res://mods/debug/debug.gd" id="1_pwqp5"]

[sub_resource type="Animation" id="Animation_oniow"]
length = 0.001
tracks/0/type = "value"
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/path = NodePath("debug_layer/debug_panel:position")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/keys = {
"times": PackedFloat32Array(0),
"transitions": PackedFloat32Array(1),
"update": 0,
"values": [Vector2(-415, 0)]
}

[sub_resource type="Animation" id="Animation_a4c61"]
resource_name = "open"
length = 0.1
tracks/0/type = "value"
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/path = NodePath("debug_layer/debug_panel:position")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/keys = {
"times": PackedFloat32Array(0, 0.1),
"transitions": PackedFloat32Array(1, 1),
"update": 0,
"values": [Vector2(-415, 0), Vector2(0, 0)]
}

[sub_resource type="AnimationLibrary" id="AnimationLibrary_q66n7"]
_data = {
"RESET": SubResource("Animation_oniow"),
"open": SubResource("Animation_a4c61")
}

[node name="debug" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2

[node name="debug_layer" type="CanvasLayer" parent="."]
layer = 50
script = ExtResource("1_pwqp5")

[node name="debug_panel" type="Panel" parent="debug_layer"]
offset_left = -415.0
offset_bottom = 1439.0

[node name="vbox" type="VBoxContainer" parent="debug_layer/debug_panel"]
offset_left = 24.0
offset_right = 397.0
offset_bottom = 1442.0
alignment = 1

[node name="bools" type="Label" parent="debug_layer/debug_panel/vbox"]
visible = false
offset_top = 708.0
offset_right = 373.0
offset_bottom = 734.0
text = "Bools:"
horizontal_alignment = 1

[node name="truefate" type="CheckBox" parent="debug_layer/debug_panel/vbox"]
visible = false
offset_top = 720.0
offset_right = 373.0
offset_bottom = 751.0
text = "True Fate Difficulty"
alignment = 1
icon_alignment = 1
expand_icon = true

[node name="items" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 538.0
offset_right = 373.0
offset_bottom = 564.0
text = "Held Item:"
horizontal_alignment = 1

[node name="items_opt" type="OptionButton" parent="debug_layer/debug_panel/vbox"]
offset_top = 568.0
offset_right = 373.0
offset_bottom = 588.0
alignment = 1

[node name="ammo" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 592.0
offset_right = 373.0
offset_bottom = 618.0
text = "Ammo:"
horizontal_alignment = 1

[node name="ammo_in" type="SpinBox" parent="debug_layer/debug_panel/vbox"]
offset_top = 622.0
offset_right = 373.0
offset_bottom = 653.0
alignment = 1

[node name="health" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 657.0
offset_right = 373.0
offset_bottom = 683.0
text = "Health:"
horizontal_alignment = 1

[node name="health_slider" type="HSlider" parent="debug_layer/debug_panel/vbox"]
offset_top = 687.0
offset_right = 373.0
offset_bottom = 703.0
value = 100.0
rounded = true

[node name="stam" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 707.0
offset_right = 373.0
offset_bottom = 733.0
text = "Stamina:"
horizontal_alignment = 1

[node name="stam_slider" type="HSlider" parent="debug_layer/debug_panel/vbox"]
offset_top = 737.0
offset_right = 373.0
offset_bottom = 753.0
value = 100.0
rounded = true

[node name="pwr" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 757.0
offset_right = 373.0
offset_bottom = 783.0
text = "Power:"
horizontal_alignment = 1

[node name="pwr_slider" type="HSlider" parent="debug_layer/debug_panel/vbox"]
offset_top = 787.0
offset_right = 373.0
offset_bottom = 803.0
value = 100.0
rounded = true

[node name="fov" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 807.0
offset_right = 373.0
offset_bottom = 833.0
text = "FOV:"
horizontal_alignment = 1

[node name="fov_slider" type="HSlider" parent="debug_layer/debug_panel/vbox"]
offset_top = 837.0
offset_right = 373.0
offset_bottom = 853.0
max_value = 200.0
value = 55.0
rounded = true

[node name="br" type="Label" parent="debug_layer/debug_panel/vbox"]
offset_top = 857.0
offset_right = 373.0
offset_bottom = 883.0
text = "Brightness:"
horizontal_alignment = 1

[node name="br_slider" type="HSlider" parent="debug_layer/debug_panel/vbox"]
offset_top = 887.0
offset_right = 373.0
offset_bottom = 903.0
max_value = 8.0

[node name="anim" type="AnimationPlayer" parent="debug_layer"]
root_node = NodePath("../..")
libraries = {
"": SubResource("AnimationLibrary_q66n7")
}

[connection signal="pressed" from="debug_layer/debug_panel/vbox/items_opt" to="debug_layer" method="_on_items_opt_pressed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/ammo_in" to="debug_layer" method="_on_ammo_in_value_changed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/health_slider" to="debug_layer" method="_on_health_slider_value_changed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/stam_slider" to="debug_layer" method="_on_stam_slider_value_changed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/pwr_slider" to="debug_layer" method="_on_pwr_slider_value_changed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/fov_slider" to="debug_layer" method="_on_fov_slider_value_changed"]
[connection signal="value_changed" from="debug_layer/debug_panel/vbox/br_slider" to="debug_layer" method="_on_br_slider_value_changed"]
����b�B�   ���� 6   res://mods/debug/debug.tscnb�ECFG      application/config/name          Forgotten Fate Debug Mod   application/run/main_scene$         res://mods/debug/debug.tscn    application/config/features(   "         4.0    Vulkan Clustered       autoload/Global0      '   *res://mods/debug/placeholder_global.gd "   display/window/size/viewport_width       
  #   display/window/size/viewport_height      �     input/debug�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             store_command            alt_pressed           shift_pressed             meta_pressed          command_pressed           pressed           keycode    0      physical_keycode          unicode           echo          script      �K9��}x}��z