defmodule MaterialIcons do
  @moduledoc """
  Provides precompiled icon compiles from [heroicons.com v<%= @vsn %>](heroicons.com).

  ## Usage

  Hero icons come in three styles – outline (`24x24`), solid (`24x24`), and mini (`20x20`).

  By default, the icon components will use the outline style, but the `solid` or
  `mini` attributes may be passed to select styling, for example:

  ```heex
  <Heroicons.cake />
  <Heroicons.cake solid />
  <Heroicons.cake mini />
  ```

  You can also pass arbitrary HTML attributes to the components:

   ```heex
  <Heroicons.cake class="w-2 h-2" />
  <Heroicons.cake solid class="w-2 h-2" />
  ```
  """
  use Phoenix.Component

  defp svg(assigns) do
    case assigns do
      ~H"<.svg_icon {@rest}><%%= {:safe, @paths[:filled]} %></.svg_icon>"
    end
  end


  attr :rest, :global, default: %{"aria-hidden": "true", fill: "none", viewBox: "0 0 24 24"}
  slot :inner_block, required: true
  defp svg_icon(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {@rest}>
      <%%= render_slot(@inner_block) %>
    </svg>
    """
  end


  <%= for icon <- @icons, {func, [filled, outlined, round, sharp, two_tone]} = icon do %>
  @doc """
  Renders the `<%= func %>` icon.

  By default, the outlined (24x24) component is used, but the `solid` or `mini`
  attributes can be provided for alternative styles.

  You may also pass arbitrary HTML attributes to be applied to the svg tag.

  ## Examples

  ```heex
  <Heroicons.<%= func %> />
  <Heroicons.<%= func %> class="w-4 h-4" />
  <Heroicons.<%= func %> solid />
  <Heroicons.<%= func %> mini />
  <Heroicons.<%= func %> outline />
  ```
  """
  attr :rest, :global, doc: "the arbitrary HTML attributes for the svg container", include: ~w(fill stroke stroke-width)
  attr :filled, :boolean, default: true
  attr :outlined, :boolean, default: false
  attr :round, :boolean, default: false
  attr :sharp, :boolean, default: false
  attr :two_tone, :boolean, default: false

  def <%= func %>(assigns) do
    svg(assign(assigns, paths: %{filled: ~S|<%= filled %>|, outlined: ~S|<%= outlined %>|, round: ~S|<%= round %>|, sharp: ~S|<%= sharp %>|, two_tone: ~S|<%= two_tone %>|}))
  end
  <% end %>
end
