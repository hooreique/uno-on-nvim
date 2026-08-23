{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    uno-ls.url = "github:hooreique/unocss-language-server";
  };

  outputs =
    { nixpkgs, uno-ls, ... }:
    let
      forAllSys =
        perSys:
        nixpkgs.lib.genAttrs [ "aarch64-darwin" "aarch64-linux" "x86_64-linux" ] (
          system:
          perSys {
            pkgs = nixpkgs.legacyPackages.${system};
            unocss-language-server = uno-ls.packages.${system}.default;
          }
        );
    in
    {
      devShells = forAllSys (
        { pkgs, unocss-language-server }:
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.nodejs_22
              pkgs.pnpm
              pkgs.typescript-language-server
              unocss-language-server
            ];
          };
        }
      );
    };
}
