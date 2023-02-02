defmodule MaterialIcons do
  @moduledoc """
  Provides precompiled icon compiles from [material icons v<%= @vsn %>](https://fonts.google.com/icons).
  """

  use Phoenix.Component

  attr :rest, :global
  attr :style, :string, required: true
  attr :size, :integer, required: true
  attr :paths, :map, required: true
  slot :inner_block, required: true
  defp svg(assigns) do
    content = case assigns.paths[assigns.style] do 
      nil -> raise RuntimeError, "icon does not have the following style: #{assigns.style}"
      svg_path -> {:safe, svg_path}
    end

    assigns = assign(assigns, :content, content)

   ~H"""
   <svg xmlns="http://www.w3.org/2000/svg" width={@size} height={@size} viewBox="0 0 24 24" {@rest}>
      <%%= @content %>
    </svg>
   """
  end


  <%= for {func, paths} <- @icons do %>
    @doc """
    Renders the `<%= func %>` icon.
    """
    attr :rest, :global, doc: "the arbitrary HTML attributes for the svg container", include: ~w(fill stroke stroke-width)
    attr :style, :string, values: ~w(filled outlined round sharp two-tone), default: "filled"
    attr :size, :integer, default: 24
    def <%= func %>(assigns), do: svg(assign(assigns, paths: <%= Macro.to_string(paths) %>))
  <% end %>
end
