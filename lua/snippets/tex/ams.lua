local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- prop, defn, thrm, lemm
  s(
    { trig = "amsprop", dscr = "AMS proposition" },
    fmta(
      [[
        \begin{prop}[<>]\label{prop:<>-<>}
          <>
        \end{prop}
      ]],
      { i(1), i(2), i(3), i(4) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amslemm", dscr = "AMS proposition" },
    fmta(
      [[
        \begin{lemm}[<>]\label{lemm:<>-<>}
          <>
        \end{lemm}
      ]],
      { i(1), i(2), i(3), i(4) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amsdefn", dscr = "AMS definition" },
    fmta(
      [[
        \begin{defn}[<>]\label{defn:<>-<>}
          <>
        \end{defn}
      ]],
      { i(1), i(2), i(3), i(4) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amscoro", dscr = "AMS corollary" },
    fmta(
      [[
        \begin{coro}[<>]\label{coro:<>-<>}
          <>
        \end{coro}
      ]],
      { i(1), i(2), i(3), i(4) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amsthrm", dscr = "AMS theorem" },
    fmta(
      [[
        \begin{thrm}[<>]\label{thrm:<>-<>}
          <>
        \end{thrm}
      ]],
      { i(1), i(2), i(3), i(4) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amsexmp*", dscr = "AMS example" },
    fmta(
      [[
        \begin{exmp}[<>]
          <>
        \end{exmp}
      ]],
      { i(1), i(2) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "amsrmrk*", dscr = "AMS remark" },
    fmta(
      [[
        \begin{rmrk}[<>]
          <>
        \end{rmrk}
      ]],
      { i(1), i(2) },
      { delimiters = "<>" }
    )
  ),
  -- cref
  s({ trig = "cref", dscr = "Cref shorthand" }, fmta([[\Cref{<>:<>-<>}]], { i(1), i(2), i(3) }, { delimiters = "<>" })),
}
