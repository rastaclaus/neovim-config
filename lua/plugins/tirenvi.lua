require("tirenvi").setup({
  parser_map = {
    csv = { command = "tir-csv", options = {} },
    tsv = { command = "tir-csv", options = { "--delimiter", "\t" } },
  }
})
