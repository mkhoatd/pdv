{
    description = "shell zig flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    outputs = { self, nixpkgs }: {
        devShells.aarch64-darwin.default =
            let
                pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            in
            pkgs.mkShell {
                packages = with pkgs; [
                    zig_0_13
                    zls
                ];
                shellHook = ''
                    sudo xcode-select --switch /Applications/Xcode.app
                '';
            };
    };
}
