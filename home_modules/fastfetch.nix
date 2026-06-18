{ ... }:

{
  programs.fastfetch = {
		enable = true;

		settings = {
			logo = {
				type = "auto";
				source = ./kirby.txt;
				color = {
					"1" = "#FF89C8";
					"2" = "#C20067";
				};
			};
			display = {
				separator = "    ";
				constants = [
					"─────────────────"
				];
				key = {
					type = "icon";
					paddingLeft = 2;
				};
			};
			modules = [
				{
					type = "custom";
					format = "┌{$1} {#1}Hardware Information{#} {$1}┐";
				}
				"host"
				"cpu"
				"gpu"
				"memory"
				"display"
				{
          type = "custom";
          format = "├{$1} {#1}Software Information{#} {$1}┤";
        }
				{
					type = "title";
          keyIcon = "";
          key = "Title";
          format = "lovro.antic1@gmail.com";
				}
				"os"
        "kernel"
				"terminal"
				"packages"
				"uptime"
				{
            type = "custom";
            format = "└{$1}──────────────────────{$1}┘";
        }
        {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
        }
			];
		};
	};
}
