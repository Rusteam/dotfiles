# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Troubleshooting

#### nvim-dap-python

[Create](https://github.com/mfussenegger/nvim-dap-python/issues/47#issuecomment-1354313329)
an extra variable in a conda env for dap to work properly.

```bash
conda env config vars set VIRTUAL_ENV=$CONDA_PREFIX
```

Then re-activate your conda environment and start nvim.

```
