{
  description = "GITY Blog - Hugo static site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Hugo (extended version with SCSS support)
            hugo

            # Go (for Hugo modules)
            go

            # Node.js and pnpm
            nodejs_22
            pnpm

            # Dart Sass
            dart-sass

            # Prettier
            nodePackages.prettier
          ];

          shellHook = ''
            echo "GITY Blog dev environment loaded"
            echo "  hugo   : $(hugo version 2>/dev/null | head -c 60)"
            echo "  go     : $(go version)"
            echo "  node   : $(node --version)"
            echo "  pnpm   : $(pnpm --version)"
            echo ""
            echo "Commands:"
            echo "  pnpm run dev   - Start dev server"
            echo "  pnpm run build - Build site"
            echo "  pnpm run new   - Create new post"
          '';
        };
      }
    );
}
