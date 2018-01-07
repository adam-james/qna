defmodule QnaWeb.QuestionControllerTest do
  use QnaWeb.ConnCase

  alias Qna.Forum
  alias Qna.Forum.Question

  @create_attrs %{author_name: "Tester", body: "What?"}
  @update_attrs %{author_name: "Tester", body: "Why?"}
  @invalid_attrs %{author_name: nil, body: nil}

  def fixture(:question) do
    {:ok, question} = Forum.create_question(@create_attrs)
    question
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "list all questions", %{conn: conn} do
      conn = get conn, question_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create question" do
    test "renders question when data is valid", %{conn: conn} do
      conn = post conn, question_path(conn, :create), question: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]
      assert json_response(conn, 201)["data"] == %{
	"id" => id,
	"author_name" => "Tester",
	"body" => "What?"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, question_path(conn, :create), question: @invalid_attrs
      assert json_response(conn, 422)["errors"] == %{
	"author_name" => ["can't be blank"],
	"body" => ["can't be blank"]}
    end
  end

  describe "update question" do
    setup [:create_question]

    test "renders question when data is valid", %{conn: conn,
						  question: %Question{id: id} = question} do
      conn = put conn, question_path(conn, :update, question), question: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, question_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
	"id" => id,
	"author_name" => "Tester",
	"body" => "Why?"}
    end

    test "renders errors when data is invalid", %{conn: conn, question: question} do
      conn = put conn, question_path(conn, :update, question), question: @invalid_attrs
      assert json_response(conn, 422)["error"] != %{}
    end
  end

  describe "delete question" do
    setup [:create_question]

    test "deletes question", %{conn: conn, question: question} do
      conn = delete conn, question_path(conn, :delete, question)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
	get conn, question_path(conn, :show, question)
      end
    end
  end
  
  defp create_question(_) do
    question = fixture(:question)
    {:ok, question: question}
  end
end
