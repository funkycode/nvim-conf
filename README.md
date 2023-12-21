# NVIM Config

My humble attempt to configure nvim for my needs

This is still WIP, as I am only learning both nvim and it's configuration

## Requirements:
### GO:
#### Tools:

```
# gopls, though mason should take care of it
go install golang.org/x/tools/gopls@latest

# gofmt, goimports and golines for formatting
go install golang.org/x/tools/cmd/gofmt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/segmentio/golines@latest 

# iferr, gomodifytags, impl
go install github.com/koron/iferr@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
go install github.com/cweill/gotests/...@latest
```

## Helpful references:

- [Neovim from scratch series](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)
- [Neovim for golang](https://www.youtube.com/watch?v=i04sSQjd-qo)
