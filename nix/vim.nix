{ pkgs, ... }:

{
  programs.vim = {
    plugins = with pkgs.vimPlugins; [
      vim-nix # Vim plugin for Nix language support
    ];
    settings = {
      number = true;
      mouse = "a";
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      copyindent = true;
    };
    extraConfig = ''
      syntax on
      set colorcolumn=80
      highlight ColorColumn ctermbg=0 guibg=lightgrey

      autocmd FileType nix setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
      autocmd BufWritePre *.nix :%s/\s\+$//e

      noremap <Leader>i gg=G``
      noremap <Leader>nf :!nixfmt %<CR>
    '';
  };
}
