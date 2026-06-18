{ config, pkgs, inputs, ...}:

{
	imports = [
		./home_modules/packages.nix
		./home_modules/hyprland.nix
		./home_modules/shell.nix
		./home_modules/fastfetch.nix
		./home_modules/waybar.nix
		./home_modules/wofi.nix
	];

	home.username = "lovro";
	home.homeDirectory = "/home/lovro";
	home.stateVersion = "25.11";

	home.file = {
		".config/theme_update.sh" = {
			source = ./home_modules/theme_update.sh;
			executable = true;
		};

		".config/waybar/scripts/caway.sh" = {
			source = ./home_modules/waybar/caway.sh;
			executable = true;
		};

		".config/waybar/scripts/colorpicker.sh" = {
			source = ./home_modules/waybar/colorpicker.sh;
			executable = true;
		};

		".config/waybar/scripts/refresh.sh" = {
			source = ./home_modules/waybar/refresh.sh;
			executable = true;
		};

		".config/waybar/scripts/select.sh" = {
			source = ./home_modules/waybar/select.sh;
			executable = true;
		};
	};

	xdg.mimeApps = {
		enable = true;
		defaultApplications = {
			"text/html"                = "librewolf.desktop";
			"x-scheme-handler/http"    = "librewolf.desktop";
			"x-scheme-handler/https"   = "librewolf.desktop";
			"x-scheme-handler/about"   = "librewolf.desktop";
			"x-scheme-handler/unknown" = "librewolf.desktop";
		};
	};

	programs.nix-search-tv.enableTelevisionIntegration = true;

	programs.git = {
		enable = true;
		settings = {
			user.name = "SpicyGengu";
			user.email = "lovro.antic1@gmail.com";
		};
	};

	programs.atuin = {
		enable = true;
		enableBashIntegration = true;
		settings = {
			search_mode = "fuzzy";
			max_preview_height = 10;
		};
	};

	programs.hyprlock = {
		enable = true;
	};

	programs.kitty = {
		enable = true;

		settings = {
			background_opacity = 0.75;
		};
	};

	services.kanshi = {
		enable = true;
		settings = [
			{
				profile.name = "undocked";
				profile.outputs = [{
					criteria = "eDP-1";
					status = "enable";
				}];
			}
			{
				profile.name = "docked";
				profile.outputs = [
					{
						criteria = "eDP-1";
						status = "enable";
					}
					{
						criteria = "*";
						mode = "1920x1080";
						position = "1920,0";
						status = "enable";
					}
				];
			}
		];
	};
}
