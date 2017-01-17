defmodule GarstApp.SmsHookControllerTest do
  use GarstApp.ConnCase

  # Unfinished.
  # Was in the middle of https://elixirschool.com/lessons/basics/testing/
  test "POST /hook/text", %{conn: conn} do
    conn = get conn, "/hook/text"
    assert html_response(conn, 401)
  end
end
