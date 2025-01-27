{
  description = "Nix Shell template";

  inputs = { };

  outputs = { self }:
  {
    templates = {
      default = { 
        path = ./DevShell;
        description = "A plain Development Shell";
      };
      c = {
        path = ./c;
        description = "C development shell";
      };
      rust = {
        path = ./rust;
        description = "Rust development shell";
      };
      zig = {
        path = ./zig;
        description = "Zig development shell";
      };
      go = {
        path = ./go;
        description = "Go development shell";
      };
      latex = {
        path = ./latex;
        description = "Latex Shell";
      };
      csharp = {
        path = ./csharp;
        description = "C# development shell";
      };
      "c++" = {
        path = ./c++;
        description = "C++ development shell";
      };
      python = {
        path = ./python;
        description = "Python development shell";
      };
    };
  };
}
