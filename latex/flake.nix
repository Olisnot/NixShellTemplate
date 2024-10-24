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
        keymaps = [
          {
            action = "<cmd>VimtexView<CR>";
            key = "<leader>vw";
            mode = [ "n" ];
          }
        ];
        plugins = {
          vimtex = {
            enable = true;
            settings = {
              compiler_method = "tectonic";
              view_general_viewer = "hyprctl dispatch exec \"[workspace 1; fullscreen]\" mupdf";
            };
          };
          lsp.servers.ltex.enable = true;
        };
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ tectonic texlivePackages.texcount ]; 

        buildInputs = [ nvim ];

        shellHook = /* bash */ ''
        '';
      };
    };
  }
