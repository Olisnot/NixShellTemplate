{
  description = "Obsidian Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvimConfig.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvimConfig }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvimConfig.packages."${system}".default.extend {
        plugins.obsidian = {
          enable = true;
          settings = {
            workspaces = [ {
              name = "Vault";
              path = ".";
            }];
            templates.subdir = "./Templates";
          };
        };
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        buildInputs = [ nvim ];

        shellHook = /* bash */ ''
        export SHELL=/run/current-system/sw/bin/bash
        echo Obsidian Vault Shell
        '';
      };
    };
}
