{
  description = "Nix Shell template";

  inputs = {
  };

  outputs = { self }:
  {
    templates = {
      DevShell= { 
        path = ./DevShell;
        description = "A plain Development Shell";
      };
    };
  };

}
