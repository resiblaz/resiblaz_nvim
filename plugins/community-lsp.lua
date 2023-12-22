return {
  vim.fn.executable "npm" == 1 and { import = "astrocommunity.pack.typescript" } or {},
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
}
