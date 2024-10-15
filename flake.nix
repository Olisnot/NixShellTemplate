{
  description = "Nix Shell template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvim }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    nvim = nixvim.packages."${system}".default.extend {
    };
  in
  {
    templates = {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ ];

        buildInputs = [ nvim ];

        shellHook = ''
        '';
      };
    };
  };

}
