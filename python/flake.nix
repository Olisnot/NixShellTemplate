{
  description = "Development Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvimConfig.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvimConfig }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvimConfig.packages."${system}".default.extend {
        plugins.lsp.servers.pylsp = {
          enable = true;
          settings.configurationSources = "flake8";
        };
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ python3 ]; 

        buildInputs = /* bash */ [ nvim ];

        shellHook = ''
        '';
      };
    };
}
