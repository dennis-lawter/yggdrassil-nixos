{
  description = "Bytomancer's NixOS configuration base flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      # Compute server
      hvergelmir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hvergelmir/configuration.nix
        ];
      };

      # FW12
      naglfar = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/naglfar/configuration.nix
        ];
      };

      # FW13
      skidbladnir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/skidbladnir/configuration.nix
        ];
      };

      # GPD Pocket 2
      hringhorni = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hringhorni/configuration.nix
        ];
      };

      # Gaming PC
      hrotti = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hrotti/configuration.nix
        ];
      };
    };
  };
}

