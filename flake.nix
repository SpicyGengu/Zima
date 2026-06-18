{
	description = "Hyper Nixos";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    claude-desktop = {
        url = "github:k3d3/claude-desktop-linux-flake";
        inputs.nixpkgs.follows = "nixpkgs-stable";
        inputs.flake-utils.follows = "flake-utils";
    };
		DTUConnect = {
			url = "https://flakehub.com/f/MikaelFangel/DTUConnect/*.tar.gz";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: 
	let
		system = "x86_64-linux";
	in
	{
		nixosConfigurations.zima = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						extraSpecialArgs = { inherit inputs; };
						users.lovro = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}
