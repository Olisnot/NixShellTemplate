{
  description = "Nix Shell template";

  inputs = {
  };

  outputs = { self }:
  {
    templates = {
      default = { 
        path = ./DevShell;
        description = "A plain Development Shell";
      };
      csharp = {
        path = ./csharp;
        description = "C# development shell";
      };
      c = {
        path = ./c;
        description = "C development shell";
      };
      cplusplus = {
        path = ./cplusplus;
        description = "C++ development shell";
      };
      python = {
        path = ./python;
        description = "Python development shell";
      };
      go = {
        path = ./go;
        description = "Go development shell";
      };
      rust = {
        path = ./rust;
        description = "Rust development shell";
      };
      latex = {
        path = ./latex;
        description = "Latex Shell";
      };
      obsidian = {
        path = ./obsidian;
        description = "Obsidian Shell";
      };
    };
  };

}
