`unocss-language-server` 가 nixpkgs 에 없어서 flake 로 만듦

https://github.com/hooreique/unocss-language-server

```bash
nix run github:hooreique/unocss-language-server -- --stdio
```

```lua
vim.lsp.config('unocss', {})
vim.lsp.enable 'unocss'
```

```bash
nix run nixpkgs#deno -- --allow-net --allow-read jsr:@std/http/file-server
```
