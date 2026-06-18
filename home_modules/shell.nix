{ ... }:

{
  programs.bash = {
		enable = true;
		shellAliases = {
			ls = "eza -T -L 1";
			theme_update = "/home/lovro/.config/theme_update.sh";
			plz = "sudo";
			please = "sudo";
			start_bluetooth = "bluetoothctl power on";
			stop_bluetooth = "bluetoothctl power off";
			clean = "clear; fastfetch; dysk";
			brillo_up = "sudo brillo -qA 5";
			brillo_down = "sudo brillo -qU 5";
			ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec hyprland
			fi
		'';
		initExtra = ''
			wal -Rq > /dev/null 2>&1
			fastfetch
			dysk
		'';
	};

	programs.readline = {
		enable = true;
		extraConfig = ''
			set completion-ignore-case on
			set show-all-if-ambiguous on
			set show-all-if-unmodified on
		'';
	};

  programs.starship = {
		enable = true;
		settings = {
			format = ''[](fg:blue)$os[](bg:blue fg:red)$username[](bg:red fg:green)$directory[ ](fg:green)$git_branch$git_status$all$character'';
			
			username = {
				show_always = true;
				format = "[$user ](bg:red fg:white)";
				disabled = false;
			};

			os = {
				disabled = false;
				style = "bg:blue fg:white";
				symbols = {
					Alpaquita = " ";
					Alpine = " ";
					AlmaLinux = " ";
					Amazon = " ";
					Android = " ";
					Arch = " ";
					Artix = " ";
					CachyOS = " ";
					CentOS = " ";
					Debian = " ";
					DragonFly = " ";
					Emscripten = " ";
					EndeavourOS = " ";
					Fedora = " ";
					FreeBSD = " ";
					Garuda = "󰛓 ";
					Gentoo = " ";
					HardenedBSD = "󰞌 ";
					Illumos = "󰈸 ";
					Kali = " ";
					Linux = " ";
					Mabox = " ";
					Macos = " ";
					Manjaro = " ";
					Mariner = " ";
					MidnightBSD = " ";
					Mint = " ";
					NetBSD = " ";
					NixOS = " ";
					Nobara = " ";
					OpenBSD = "󰈺 ";
					openSUSE = " ";
					OracleLinux = "󰌷 ";
					Pop = " ";
					Raspbian = " ";
					Redhat = " ";
					RedHatEnterprise = " ";
					RockyLinux = " ";
					Redox = "󰀘 ";
					Solus = "󰠳 ";
					SUSE = " ";
					Ubuntu = " ";
					Unknown = " ";
					Void = " ";
					Windows = "󰍲 ";
				};
			};

			cmd_duration = {
				format = "[$duration](fg:red)";
			};

			directory = {
				format = "[$path](bg:green fg:white)";
				truncation_length = 2;
				truncation_symbol = "…/";
				substitutions = {
					"Documents" = "󰈙 ";
					"Downloads" = " ";
					"Music" = "󰝚 ";
					"Pictures" = " ";
					"Scripts" = "󰲋 ";
				};
			};

			character = {
				success_symbol = "[](bold blue)";
				error_symbol = "[✗](bold red)";
				disabled = false;
			};

			fossil_branch = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			git_branch = {
				symbol = "  ";
				format = "[$symbol($branch) ($version)]($style)";
			};

			git_commit = {
				tag_symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			aws = {
				symbol = "   ";
				format = "[$symbol($version)]($style)";
			};

			buf = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			c = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			cmake = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			conda = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			crystal = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			dart = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			docker_context = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			elixir = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			elm = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			fennel = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			golang = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			guix_shell = {
				symbol = "   ";
				format = "[$symbol($version)]($style)";
			};

			haskell = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			haxe = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			hg_branch = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			hostname = {
				ssh_symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			java = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			julia = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			kotlin = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			lua = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			memory_usage = {
				symbol = " 󰍛 ";
				format = "[$symbol($version)]($style)";
			};

			meson = {
				symbol = " 󰔷 ";
				format = "[$symbol($version)]($style)";
			};

			nim = {
				symbol = " 󰆥 ";
				format = "[$symbol($version)]($style)";
			};

			nix_shell = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			nodejs = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			ocaml = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			package = {
				symbol = " 󰏗 ";
				format = "[$symbol($version)]($style)";
			};

			perl = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			php = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			pijul_channel = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			python = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			rlang = {
				symbol = " 󰟔 ";
				format = "[$symbol($version)]($style)";
			};

			ruby = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			rust = {
				symbol = " 󱘗 ";
				format = "[$symbol($version)]($style)";
			};

			scala = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			swift = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			zig = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};

			gradle = {
				symbol = "  ";
				format = "[$symbol($version)]($style)";
			};
		};
	};
}
