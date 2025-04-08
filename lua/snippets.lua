local ls = require("luasnip")

local s = ls.s
local parse = ls.parser.parse_snippet

ls.add_snippets("go", {
  parse({ trig = "ie", name = "If Err", dscr = "Insert a basic if err not nil statement" }, [[
  if err != nil {
    return err
  }
  ]]),
})
