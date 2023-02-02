defmodule MaterialIcons do
  @moduledoc """
  Provides precompiled icon compiles from [material icons v<%= @vsn %>](https://fonts.google.com/icons).
  """

  use Phoenix.Component

  attr :style, :string, values: ~w(filled outlined round sharp two-tone), default: "filled"
  attr :size, :integer, default: 24
  slot :inner_block, required: true
  attr :paths, :map, required: true
  attr :class, :string, default: ""
  defp svg(assigns) do
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
