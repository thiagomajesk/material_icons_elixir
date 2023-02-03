# MaterialIcons

[Material icons](https://fonts.google.com/icons) is a collection of icons designed by Google under the material design guidelines.
This library provides optimized svgs for each icon packaged as a Phoenix Component and is heavily inspired by the [heroicons_elixir](https://github.com/mveytsman/heroicons_elixir) project.

The icons can be browsed in a more user-friendly way at https://fonts.google.com/icons. Use the dropdown menu near top left to choose the Material Icons set.

The svg icons used by this library are optimized using SVGO and were collected from @marella's repository: https://github.com/marella/material-design-icons as indicated in the original material design icons repo's README: https://github.com/google/material-design-icons#material-design-iconssvg-- which are available under the Apache 2.0 License.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `material_icons` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:material_icons, "~> 0.1.0"}
  ]
end
```

## Usage

The components are provided by the `MaterialIcons` module. Each icon is a Phoenix Component you case use in your HEEx templates.
By default, the icon components will use the filled style and the 24px size, but others values can be specified if you want to. 

```heex
  <MaterialIcons.auto_awesome/>
  <MaterialIcons.auto_awesome style="outlined" />
  <MaterialIcons.auto_awesome style="two-tone" />
```

 ```heex
  <MaterialIcons.auto_awesome style="two-tone" size={42} />
  <MaterialIcons.auto_awesome style="two-tone" class="fill-green-500" />
```

If you want to compile the icons yourself, you can run the mix task `mix icons` to see helpfull information.
You can also configure a different version of the icons and which styles you want to be included in the final bundle:

```elixir
config :material_icons, 
  version: "0.14.2",
  styles: ~w(filled outlined round sharp two-tone)
```
