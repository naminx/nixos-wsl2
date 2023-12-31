{pkgs}:
with pkgs; let
  fish-vim = vimUtils.buildVimPluginFrom2Nix {
    pname = "fish-vim";
    version = "2022-05-12";
    src = fetchFromGitHub {
      owner = "nickeb96";
      repo = "fish.vim";
      rev = "60492e9f7577e74a159e2de504607b36da45c50e";
      sha256 = "sha256-/dtesa2uZpUA6qadcdtkC4pxQusDyWJEYAf/zSZB3Uk=";
    };
  };
  myVimPlugins = with vimPlugins; [
    fish-vim # fish syntax highlighting
    gruvbox # color scheme close to "Groovy Lambda"
    haskell-vim # haskell syntax highlighting
    rainbow # color parenthesis
    vim-airline # customized status line
    vim-lastplace # remember last position
    vim-nix # nix source file highlight
  ];
in {
  customRC = lib.strings.fileContents ./init.vim;
  packages.myPlugins = with vimPlugins; {
    start = myVimPlugins;
    opt = [];
  };
}
