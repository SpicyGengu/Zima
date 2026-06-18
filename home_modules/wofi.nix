{ ... }:

{
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

	xdg.configFile = {
		# Wallpaper config
		"wofi/config-wallpaper".text = ''
			[config]
			allow_images=true
			show=drun
			width=800
			height=600
			always_parse_args=true
			show_all=true
			term=kitty
			hide_scroll=true
			print_command=true
			insensitive=true
			columns=4
			image_size=150
		'';

		"wofi/style-wallpaper.css".source = ./wofi_css/style-wallpaper.css;

		# Waybar config
		"wofi/config-waybar".text = ''
			[config]
			allow_images=true
			show=drun
			width=1200
			height=600
			always_parse_args=true
			show_all=true
			term=kitty
			hide_scroll=true
			print_command=true
			insensitive=true
			columns=1
			image_size=1050
		'';

		"wofi/style-waybar.css".source = ./wofi_css/style-waybar.css;
	};
}
