{ config, ... }:

{
  wayland.windowManager.hyprland = {
		enable = true;
		configType = "hyprlang";
		settings = {
			source = "${config.home.homeDirectory}/.cache/wal/colors-hyprland.conf";

			monitor = ",preferred,auto,auto";

			"$terminal" = "kitty";
			"$fileManager" = "yazi";
			"$browser" = "librewolf";
			"$menu" = "wofi --show drun";
			"$mainMod" = "SUPER";

			# Autostart
			exec-once = [
				"gnome-keyring-daemon --start --components=secrets"
				"waybar"
				"udiskie"
				"swaync"
				"hyprpaper"
				"[workspace 5 silent] discord"
				"[workspace 4 silent] thunderbird"
			];

			# Environment variables
			env = [
				"GDK_SCALE,1.5"
				"ELECTRON_OZONE_PLATFORM_HINT,wayland"
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
			];

			# Rid me of steam pixelation
			xwayland = {
				force_zero_scaling = true;
			};

			# General settings
			general = {
				gaps_in = 2;
				gaps_out = 10;
				border_size = 2;
				"col.active_border" = "$color6";
				"col.inactive_border" = "0";
				resize_on_border = true;
				allow_tearing = false;
				layout = "dwindle";
			};

			# Decoration
			decoration = {
				rounding = 10;
				
				active_opacity = 1.0;
				inactive_opacity = 1.0;
				
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};
				
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

			# Animations
			animations = {
				enabled = true;
				
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];
				
				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
				];
			};

			# Layouts
			dwindle = {
				preserve_split = true;
			};

			master = {
				new_status = "master";
			};

			# Misc
			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
				initial_workspace_tracking = 0;
			};

			# Input
			input = {
				kb_layout = "dk";
				follow_mouse = 1;
				sensitivity = 0;
				
				touchpad = {
					natural_scroll = true;
				};
			};

			device = {
				name = "epic-mouse-v1";
				sensitivity = -0.5;
			};
			
			# Keybindings
			bindl = [
				",switch:Lid Switch, exec, hyprlock"
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];

			bind = [
				"$mainMod, RETURN, exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, ESCAPE, exit,"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, SPACE, exec, $menu"
				"$mainMod, P, pseudo,"
				"$mainMod, J, layoutmsg, togglesplit"
				"$mainMod, F, exec, $browser"
				"$mainMod, L, exec, hyprlock"
				", Print, exec, hyprshot -m region -o /home/lovro/Pictures/screenshots/"
				
				# Move focus
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				
				# Workspaces
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				"$mainMod, tab, workspace, e+1"
				"$mainMod SHIFT, tab, workspace, e-1"
				
				# Move to workspace
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				
				# Special workspace
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
				
				# Scroll workspaces
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];

			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brillo -qA 5"
				",XF86MonBrightnessDown, exec, brillo -qU 5"
			];
			
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			# For some reason the underneath things aren't relevante anymore?!

			# Window rules
			# windowrule = [
			# 	"suppressevent maximize, class:.*"
			# 	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			# ];

			# Layer rules
			# layerrule = [
			# 	"blur on, waybar"
			# 	"ignorezero on, waybar"
			# 	"ignorealpha 0.5, waybar"
				
			# 	"blur on, wofi"
				
			# 	"blur on, swaync-control-center"
			# 	"blur on, swaync-notification-window"
			# 	"ignorezero on, swaync-control-center"
			# 	"ignorezero on, swaync-notification-window"
			# 	"ignorealpha 0.5, swaync-control-center"
			# 	"ignorealpha 0.5, swaync-notification-window"
			# ];
		};
	};

	xdg.configFile."hypr/hyprlock.conf".text = ''
		source = /home/${config.home.username}/.cache/wal/colors-hyprland.conf
		background {
			monitor =
			path = $wallpaper
			blur_size = 5
			blur_passes = 3
			brightness = .6
		}
		input-field {
			monitor =
			size = 16%, 4%
			outline_thickness = 0
			dots_rounding = 4
			dots_spacing = .5
			dots_fase_time = 300
			inner_color = $backgroundCol
			outer_color = $backgroundCol $backgroundCol
			check_color= $backgroundCol $backgroundCol
			fail_color= $backgroundCol $backgroundCol
			font_color = $color9
			font_family = CodeNewRoman Nerd Font Propo
			fade_on_empty = false
			shadow_color = rgba(0,0,0,0.5)
			shadow_passes = 2
			shadow_size = 2
			rounding = 20
			placeholder_text = <i></i>
			fail_text = <b>FAIL</b>
			fail_timeout = 300
			position = 0, -400
			halign = center
			valign = center
		}
		label {
			monitor =
			text = cmd[update:1000] date +"<b>%I</b>"
			color = $color4
			font_size = 200
			font_family = CodeNewRoman Nerd Font Propo
			shadow_passes = 0
			shadow_size = 5
			position = -120, 120
			halign = center
			valign = center
		}


		label {
			monitor =
			text = cmd[update:1000] date +"<b>%M</b>"
			color = $color9 #rgba(150,150,150, .4)
			font_size = 200
			font_family = CodeNewRoman Nerd Font Propo
			shadow_passes = 0
			shadow_size = 5
			position = 120, -80
			halign = center
			valign = center
		}
		label {
			monitor =
			text = cmd[update:1000] date +"<b>%A, %B %d, %Y</b>"
			color = $color4
			font_size = 40
			font_family = CodeNewRoman Nerd Font Propo
			shadow_passes = 0
			shadow_size = 4
			position = -40,-20
			halign = right
			valign = top
		}
		label {
			monitor =
			text = <i>Fuck off cunt!</i>
			color = $color5 
			font_size = 40
			font_family = CodeNewRoman Nerd Font Propo
			shadow_passes = 0
			shadow_size = 4
			position = 40,-20
			halign = left
			valign = top
		}
	'';

	xdg.configFile."wal/templates/colors-hyprland.conf".text = ''
		$wallpaper = {wallpaper}

		$foreground = rgb({foreground.strip})
		$color0 = rgb({color0.strip})
		$color1 = rgb({color1.strip})
		$color2 = rgb({color2.strip})
		$color3 = rgb({color3.strip})
		$color4 = rgb({color4.strip})
		$color5 = rgb({color5.strip})
		$color6 = rgb({color6.strip})
		$color7 = rgb({color7.strip})
		$color8 = rgb({color8.strip})
		$color9 = rgb({color9.strip})
		$color10 = rgb({color10.strip})
		$color11 = rgb({color11.strip})
		$color12 = rgb({color12.strip})
		$color13 = rgb({color13.strip})
		$color14 = rgb({color14.strip})
		$color15 = rgb({color15.strip})
	'';
}
