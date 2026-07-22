{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
		atuin
		brave
		catppuccin-cursors.mochaDark
		cava
		discord
		gh
		gimp
		gnome-calculator
		inputs.claude-desktop.packages.${pkgs.stdenv.hostPlatform.system}.claude-desktop
		inputs.DTUConnect.packages.${pkgs.stdenv.hostPlatform.system}.default
		kdePackages.kdeconnect-kde
		libreoffice
		librewolf-bin
		nerd-fonts.symbols-only
		obsidian
		#omnissa-horizon-client
		qFlipper
		rustup
		spicetify-cli
		spotify
		steam
		thunderbird
	];
}
