-- Inline color previews for #hex, rgb(), hsl(), named colors, etc.
-- Maintained fork of the original norcalli/nvim-colorizer.lua
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
}
