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
    { trig = "h1", desr = "Section" },
    fmta(
      [[
    \section{<>}

    ]],
      {
        i(1, "section header"),
      }
    )
  ),
  s(
    { trig = "h2", desr = "Subsection" },
    fmta(
      [[
      \subsection{<>}

    ]],
      {
        i(1, "subsection header"),
      }
    )
  ),
  s(
    { trig = "h3", desr = "Subsubsection" },
    fmta(
      [[
    \subsubsection{<>}

    ]],
      { i(1, "subsubsection header") }
    )
  ),
  s(
    { trig = "h1*", desr = "Section" },
    fmta(
      [[
    \section*{<>}

    ]],
      {
        i(1, "section header"),
      }
    )
  ),
  s(
    { trig = "h2*", desr = "Subsection" },
    fmta(
      [[
    \subsection*{<>}

    ]],
      {
        i(1, "subsection header"),
      }
    )
  ),
  s(
    { trig = "h3*", desr = "Subsubsection" },
    fmta(
      [[
    \subsubsection*{<>}

    ]],
      {
        i(1, "subsubsection header"),
      }
    )
  ),
  s(
    { trig = "p", desr = "Paragraph" },
    fmta(
      [[
    \paragraph{<>}

    ]],
      {
        i(1, "paragraph title"),
      }
    )
  ),
}
