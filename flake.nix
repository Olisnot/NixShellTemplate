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
      c-cplusplus = {
        path = ./c-cplusplus;
        description = "C and C++ development shell";
      };
      python = {
        path = ./python;
        description = "Python development shell";
      };
      latex = {
        path = ./latex;
        description = "Latex Shell";
      };
    };
  };

}
