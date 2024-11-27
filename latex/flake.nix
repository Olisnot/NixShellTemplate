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
          action = "<cmd>TeXpresso %<CR>";
          key = "<leader>vw";
          mode = [ "n" ];
        }
        {
          action = "<cmd>VimtexCompileSS<CR>";
          key = "<leader>c";
          mode = [ "n" ];
        }
      ];
      plugins = {
        texpresso.enable = true;
        vimtex = {
          enable = true;
          settings = {
            compiler_method = "tectonic";
            view_general_viewer = "";
          };
        };

        lsp.servers.ltex.enable = true;
      };

    };
  in
  {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [ tectonic texlivePackages.texcount texpresso ]; 

      buildInputs = [ nvim ];

      shellHook = /* bash */ ''
        export SHELL=/run/current-system/sw/bin/bash
      '';
    };
  };
}
