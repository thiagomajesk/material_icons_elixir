import Config

# default configuration for the material icons
config :material_icons,
  version: "0.14.2",
  styles: ~w(filled outlined round sharp two-tone)

# silence phoenix warnings
config :phoenix, :json_library, MaterialIcons
