local ih = require("inlay-hints")

require("rust-tools").setup({
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = true,
    },
  },
  server = {
    on_attach = function(c, b)
      ih.on_attach(c, b)
    end,
  },
})
