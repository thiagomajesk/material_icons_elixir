defmodule MaterialIconsTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest

  setup do
    Mix.Task.run("icons.build")
    {:ok, assigns: %{__changed__: nil}}
  end

  describe "icon styles" do
    test "filled by default" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"m19 9 1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25L19 9zm-7.5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zM19 15l-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25L19 15z\"></path>\n</svg>"
    end

    test "filled" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{style: "filled"}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"m19 9 1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25L19 9zm-7.5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zM19 15l-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25L19 15z\"></path>\n</svg>"
    end

    test "outlined" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{style: "outlined"}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"m19 9 1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25zm0 6-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25zm-7.5-5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zm-1.51 3.49L9 15.17l-.99-2.18L5.83 12l2.18-.99L9 8.83l.99 2.18 2.18.99-2.18.99z\"></path>\n</svg>"
    end

    test "round" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{style: "round"}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"m19.46 8 .79-1.75L22 5.46a.5.5 0 0 0 0-.91l-1.75-.79L19.46 2a.5.5 0 0 0-.91 0l-.79 1.75-1.76.79a.5.5 0 0 0 0 .91l1.75.79.79 1.76c.18.39.74.39.92 0zM11.5 9.5 9.91 6c-.35-.78-1.47-.78-1.82 0L6.5 9.5 3 11.09c-.78.36-.78 1.47 0 1.82l3.5 1.59L8.09 18c.36.78 1.47.78 1.82 0l1.59-3.5 3.5-1.59c.78-.36.78-1.47 0-1.82L11.5 9.5zm7.04 6.5-.79 1.75-1.75.79a.5.5 0 0 0 0 .91l1.75.79.79 1.76a.5.5 0 0 0 .91 0l.79-1.75 1.76-.79a.5.5 0 0 0 0-.91l-1.75-.79-.79-1.76a.508.508 0 0 0-.92 0z\"></path>\n</svg>"
    end

    test "sharp" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{style: "sharp"}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"m19 9 1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25L19 9zm-7.5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zM19 15l-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25L19 15z\"></path>\n</svg>"
    end

    test "two-tone" do
      assert render_component(&MaterialIcons.auto_awesome/1, %{style: "two-tone"}) ==
               "<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n  <path d=\"M9.99 11.01 9 8.83l-.99 2.18-2.18.99 2.18.99.99 2.18.99-2.18 2.18-.99z\" opacity=\".3\"></path><path d=\"m19 9 1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25zm0 6-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25zm-7.5-5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zm-1.51 3.49L9 15.17l-.99-2.18L5.83 12l2.18-.99L9 8.83l.99 2.18 2.18.99-2.18.99z\"></path>\n</svg>"
    end
  end
end
