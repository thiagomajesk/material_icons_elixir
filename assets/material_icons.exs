defmodule MaterialIcons do
  @moduledoc """
  Provides precompiled icons from [material icons v<%= @vsn %>](https://fonts.google.com/icons).

  ## Usage

  Material icons come in five styles: filled, outlined, round, sharp and two-tone.

  By default, the icon components will use the filled style, but the style attribute
  may be passed to select styling, for example:

   ```heex
  <MaterialIcons.auto_awesome/>
  <MaterialIcons.auto_awesome style="outlined" />
  <MaterialIcons.auto_awesome style="two-tone" />
  ```

  You can also pass the size and class attributes to the components:

  ```heex
  <MaterialIcons.auto_awesome style="two-tone" size={42} />
  <MaterialIcons.auto_awesome style="two-tone" class="fill-green-500" />
  ```
  """

  use Phoenix.Component

  attr :style, :string, values: ~w(filled outlined round sharp two-tone), default: "filled"
  attr :size, :integer, default: 24
  attr :paths, :map, required: true
  attr :class, :string, default: nil
  defp svg(assigns) do
    # TODO: Check why Phoenix is not throwing when attr has 'values' option and you pass invalid values.
    # TODO: Check why Phoenix is not throwing when attr has 'required' option and you don't pass values.
    content = case assigns.paths[assigns.style] do
      nil -> raise RuntimeError, "icon does not have the following style: #{assigns.style}"
      svg_path -> {:safe, svg_path}
    end

    assigns = assign(assigns, :content, content)

   ~H"""
   <svg xmlns="http://www.w3.org/2000/svg" class={@class} width={@size} height={@size} viewBox="0 0 24 24">
      <%%= @content %>
    </svg>
   """
  end


  <%= for {func, paths} <- @icons do %>
    @doc """
    Renders the `<%= func %>` icon.
    """
    def <%= func %>(assigns), do: svg(assign(assigns, paths: <%= Macro.to_string(paths) %>))
  <% end %>
end
