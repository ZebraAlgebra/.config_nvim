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
  -- figure generation
  s(
    { trig = "enumm", dscr = "Enumerate with more control" },
    fmta(
      [[
        \begin{enumerate}[label=(\<>*)]
          \item <>
        \end{enumerate}
      ]],
      { i(1), i(2) },
      { delimiters = "<>" }
    )
  ),
  -- figure generation
  s(
    { trig = "fig", dscr = "Boilerplate for embedding figures" },
    fmta(
      [[
        \begin{figure}
          \begin{center}
            \includegraphics[width=<>\textwidth]{figures/<>}
          \end{center}
          \caption{<>}
          \label{fig:<>}
        \end{figure}

      ]],
      { i(1), i(2), i(4), i(3) },
      { delimiters = "<>" }
    )
  ),
  -- href
  s(
    { trig = "href", desr = "Boilerplate for href" },
    fmta([[\href{<>}{<>}]], {
      i(1, "url"),
      i(2, "name"),
    })
  ),
  -- frac
  s(
    { trig = "frac", desr = "Boilerplate for fraction" },
    fmta([[\frac{<>}{<>}]], {
      i(1, "numer"),
      i(2, "denom"),
    })
  ),
  -- tables
  s(
    { trig = "tabular", desr = "Tabular boileterplate" },
    fmta(
      [[
      \begin{center}
        \begin{tabular}{|l|l|l|<>}
        \hline
        &&<>\\
        \end{tabular}
      \end{center}

    ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  -- align
  s(
    { trig = "align", desr = "Align environment" },
    fmta(
      [[
      \begin{align}
      <>&\\
      \end{align}

    ]],
      {
        i(1),
      }
    )
  ),
  -- align*
  s(
    { trig = "align*", desr = "Align environment" },
    fmta(
      [[
      \begin{align*}
      <>&\\
      \end{align*}

    ]],
      {
        i(1),
      }
    )
  ),
}
