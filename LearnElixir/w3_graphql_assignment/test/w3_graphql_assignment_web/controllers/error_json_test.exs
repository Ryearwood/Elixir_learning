defmodule W3GraphqlAssignmentWeb.ErrorJSONTest do
  use W3GraphqlAssignmentWeb.ConnCase, async: true

  test "renders 404" do
    assert W3GraphqlAssignmentWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert W3GraphqlAssignmentWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
