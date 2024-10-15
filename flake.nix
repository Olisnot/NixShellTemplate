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
    };
  };

}
