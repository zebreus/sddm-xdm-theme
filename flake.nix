{
  description = "A sddm theme that looks like xdm";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      pkgs = import nixpkgs { inherit system; };

      name = "sddm-xdm-theme";
      packages.sddm-xdm-theme = pkgs.callPackage ./default.nix { };
      packages.default = packages.sddm-xdm-theme;

      formatter = pkgs.nixfmt-rfc-style;
    });
}
