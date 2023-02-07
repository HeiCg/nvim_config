local node_bin = vim.fn.expand("$HOME/.nvm/versions/node/v15.14.0/bin")
vim.g.node_host_prog = node_bin .. "/node"
vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")
