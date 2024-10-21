{
  description = "C# Development Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvimConfig.url = "github:Olisnot/NixVimConfig";
  };

  outputs = { self, nixpkgs, nixvimConfig }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvimConfig.packages."${system}".default.extend {
        plugins.lsp.servers.csharp_ls.enable = true;
      };
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [ dotnetCorePackages.sdk_8_0_3xx ]; 

        buildInputs = [ nvim ];

        shellHook = /* bash */ ''
        '';
        DOTNET_CLI_TELEMETRY_OPTOUT = "1";
      };
    };
}
