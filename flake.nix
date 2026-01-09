{
  description = "Bytomancer's NixOS configuration base flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      hvergelmir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hvergelmir/configuration.nix
        ];
      };

      skidbladnir = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/skidbladnir/configuration.nix
        ];
      };
    };
  };
}

