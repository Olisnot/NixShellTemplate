{
  description = "Latex Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvimConfig.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvimConfig }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvimConfig.packages."${system}".default.extend {
        plugins = {
          vimtex.enable = true;
          lsp.servers.ltex.enable = true;
        };
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ tectonic ]; 

        buildInputs = [ nvim ];

        shellHook = /* bash */ ''
        '';
      };
    };
}
