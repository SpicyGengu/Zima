{ config, ... }:

{
  programs.waybar = {
		enable = true;

		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				reload_style_on_change = true;

				modules-left = [
					"custom/notification"
					"clock"
					"custom/pacman"
					"tray"
					"custom/music"
				];

				modules-center = [ "hyprland/workspaces" ];

				modules-right = [
					"group/expand"
					"bluetooth"
					"pulseaudio"
					"network"
					"battery"
				];

				"hyprland/workspaces" = {
					format = "{icon}";
					format-icons = {
						active = "";
						default = "";
						empty = "";
					};
					persistent-workspaces = {
						"*" = [ 1 2 3 4 5 ];
					};
				};

				"custom/notification" = {
					tooltip = false;
					format = "";
					on-click = "swaync-client -t -sw";
					escape = true;
				};

				clock = {
					format = "{:%I:%M:%S %p}";
					interval = 1;
					tooltip-format = "<tt>{calendar}</tt>";
					calendar = {
						format = {
							today = "<span color='#fAfBfC'><b>{}</b></span>";
						};
					};
					actions = {
						on-click-right = "shift_down";
						on-click = "shift_up";
					};
				};

				network = {
					format-wifi = "";
					format-ethernet = "";
					format-disconnected = "";
					tooltip-format-disconnected = "Error";
					tooltip-format-wifi = "{essid} ({signalStrength}%) ";
					tooltip-format-ethernet = "{ifname} 🖧 ";
					on-click = "kitty nmtui";
				};

				bluetooth = {
					format-on = "󰂯";
					format-off = "BT-off";
					format-disabled = "󰂲";
					format-connected-battery = "{device_battery_percentage}% 󰂯";
					format-alt = "{device_alias} 󰂯";
					tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
					tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
					tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
					tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
					on-click-right = "blueman-manager";
				};

				battery = {
					interval = 30;
					states = {
						good = 95;
						warning = 30;
						critical = 20;
					};
					format = "{capacity}% {icon}";
					format-charging = "{capacity}% 󰂄";
					format-plugged = "{capacity}% 󰂄 ";
					format-alt = "{time} {icon}";
					format-icons = [
						"󰁻"
						"󰁼"
						"󰁾"
						"󰂀"
						"󰂂"
						"󰁹"
					];
				};

				"custom/pacman" = {
					format = "󰅢";
					on-click = "kitty sh -c 'cd /etc/nixos; sudo nix flake update; echo Done. System reboot needed. - Press enter to exit; read'; pkill -SIGRTMIN+8 waybar";
					signal = 8;
					tooltip = false;
				};

				"custom/expand" = {
					format = "";
					tooltip = false;
				};

				"custom/endpoint" = {
					format = "|";
					tooltip = false;
				};

				"group/expand" = {
					orientation = "horizontal";
					drawer = {
						transition-duration = 600;
						transition-to-left = true;
						click-to-reveal = true;
					};
					modules = [
						"custom/expand"
						"custom/colorpicker"
						"cpu"
						"memory"
						"temperature"
						"custom/endpoint"
					];
				};

				"custom/colorpicker" = {
					format = "{}";
					return-type = "json";
					interval = "once";
					exec = "${config.home.homeDirectory}/.config/waybar/scripts/colorpicker.sh -j";
					on-click = "${config.home.homeDirectory}/.config/waybar/scripts/colorpicker.sh";
					signal = 1;
					tooltip = false;
				};

				"custom/music" = {
					format = "{text}";
					format-icons = {
						Paused = " ";
						Stopped = "&#x202d;ﭥ ";
					};
					escape = true;
					tooltip = true;
					exec = "${config.home.homeDirectory}/.config/waybar/scripts/caway.sh";
					return-type = "json";
					on-click = "playerctl play-pause";
					on-click-right = "playerctl next";
					max-length = 20;
				};

				pulseaudio = {
					format = "{icon}";
					format-bluetooth = "{icon}";
					format-muted = "";
					format-icons = {
						"alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
						"alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
						headphone = "";
						hands-free = "";
						headset = "";
						phone = "";
						phone-muted = "";
						portable = "";
						car = "";
						default = [ "" "" ];
					};
					scroll-step = 1;
					on-click = "pavucontrol";
					ignored-sinks = [ "Easy Effects Sink" ];
					tooltip-format = "{volume}%";
				};

				cpu = {
					format = "󰻠";
					tooltip = true;
					on-click = "kitty htop &";
				};

				memory = {
					format = "";
				};

				temperature = {
					critical-threshold = 80;
					format = "";
				};

				tray = {
					icon-size = 14;
					spacing = 10;
				};
			};
		};
		style = builtins.readFile ./waybar/style.css;
	};

	programs.wofi = {
    	enable = true;
    
		settings = {
			# Default config
			allow_images = true;
			width = 500;
			show = "drun";
			prompt = "Search";
			height = 400;
			term = "kitty";
			hide_scroll = true;
			print_command = true;
			insensitive = true;
			columns = 1;
			no_actions = true;
		};
    
    	style = builtins.readFile ./wofi_css/style.css;
	};
}
