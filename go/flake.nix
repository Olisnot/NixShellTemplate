{
  description = "Go Development Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvimConfig.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvimConfig }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvimConfig.packages."${system}".default.extend {
        plugins.lsp.servers = {
          gopls.enable = true;
          golangci_lint_ls.enable = true;
        };
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ go ]; 

        buildInputs = /* bash */ [ nvim ];

        shellHook = ''
        export SHELL=/run/current-system/sw/bin/bash
        '';
      };
    };
}
