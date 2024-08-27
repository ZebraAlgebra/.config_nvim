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
  s(
    { trig = "mscr", desr = "mathscr" },
    fmta(
      [[
      \mathscr{<>}
    ]],
      {
        i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "mbb", desr = "mathbb" },
    fmta(
      [[
      \mathbb{<>}
    ]],
      {
        i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "mop", desr = "operatorname" },
    fmta(
      [[
      \operatorname{<>}
    ]],
      {
        i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "margmin", desr = "argmin" },
    fmta(
      [[
      \underset{<>}{\operatorname{argmin}}
    ]],
      {
        i(1, "condition"),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "margmax", desr = "argmax" },
    fmta(
      [[
      \underset{<>}{\operatorname{argmax}}
    ]],
      {
        i(1, "condition"),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "minf", desr = "infimum" },
    fmta(
      [[
      \underset{<>}{\operatorname{inf}}
    ]],
      {
        i(1, "condition"),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "msup", desr = "supremum" },
    fmta(
      [[
      \underset{<>}{\operatorname{sup}}
    ]],
      {
        i(1, "condition"),
      },
      { delimiters = "<>" }
    )
  ),
  -- custom weird commands to sometimes use
  s({ trig = "c-ext-r", desr = "extended real line" }, { t "\\overline{\\mathbb{R}}" }),
  s(
    { trig = "c-set", desr = "set wrapper" },
    fmta(
      [[
      \{<>\}
    ]],
      {
        i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "c-optprob", dscr = "Optimization Problem Template" },
    fmta(
      [[
        \begin{align*}
          \text{M<>imize}\quad    & <>\\
          \text{subject to}\quad  & <>\\
        \end{align*}
      ]],
      { i(1, "ax"), i(2), i(3) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = "c-mat-ij", dscr = "Space of matrices template" },
    fmta([[\mathbf{M}_{<>,<>}(\mathbb{<>})]], { i(1, "i"), i(2, "j"), i(3, "R") }, { delimiters = "<>" })
  ),
  s(
    { trig = "c-seq", dscr = "indexed set template" },
    fmta([[\{<>\}_{<>}^{<>}]], { i(1, "elem"), i(2, "i=1"), i(3, "k") }, { delimiters = "<>" })
  ),
}
