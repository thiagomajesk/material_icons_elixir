defmodule MaterialIcons do
  @moduledoc """
  Provides precompiled icon compiles from [material icons v<%= @vsn %>](https://fonts.google.com/icons).
  """

  use Phoenix.Component

  attr :rest, :global, default: %{width: "24", height: "24", viewBox: "0 0 24 24"}
  attr :style, :string, values: ~w(filled outlined round sharp two-tone), default: "filled"
  slot :inner_block, required: true
  defp svg(assigns) do
   ~H"""
   <svg xmlns="http://www.w3.org/2000/svg" {@rest}>
      <%%= {:safe, @paths[@style]} %>
    </svg>
   """
  end


  <%= for {func, paths} <- @icons do %>
    @doc """
    Renders the `<%= func %>` icon.
    """
    attr :rest, :global, doc: "the arbitrary HTML attributes for the svg container", include: ~w(fill stroke stroke-width)
    def <%= func %>(assigns), do: svg(assign(assigns, paths: <%= Macro.to_string(paths) %>))
  <% end %>
end
