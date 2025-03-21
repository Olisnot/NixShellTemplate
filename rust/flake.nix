{
  description = "Rust Development Shell";

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
        rustaceanvim.enable = true;
        dap.enable = true;
        dap-ui.enable = true;
        dap-lldb.enable = true;
      };
    };
  in
  {
    devShells."${system}".default = pkgs.mkShell {
      buildInputs = /* bash */ [ nvim ];
      nativeBuildInputs = with pkgs; [ rustc cargo gcc rustfmt clippy ];
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

      shellHook = ''
      export SHELL=/run/current-system/sw/bin/bash
      '';
    };
  };
}
