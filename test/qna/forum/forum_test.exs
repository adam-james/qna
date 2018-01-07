defmodule Qna.ForumTest do
  use Qna.DataCase

  alias Qna.Forum

  describe "questions" do
    alias Qna.Forum.Question

    @valid_attrs %{author_name: "tester", body: "what?"}
    @update_attrs %{author_name: "tester", body: "why?"}
    @invalid_attrs %{author_name: nil, body: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forum.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Forum.list_questions() == [question]
    end

    test "get_question!/1 returns the question with the given id" do
      question = question_fixture()
      assert Forum.get_question!(question.id) == question
    end

    test "create_question/1 creates a new question" do
      assert {:ok, %Question{} = question} = Forum.create_question(@valid_attrs)
      assert question.author_name == "tester"
      assert question.body == "what?"
    end

    test "create_question/1 returns changeset when data invalid" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_question(@invalid_attrs)
    end

    test "update_question/1 updates question when data is valid?" do
      question = question_fixture()
      assert {:ok, question} = Forum.update_question(question, @update_attrs)
      assert %Question{} = question
      assert question.author_name == "tester"
      assert question.body == "why?"
    end

    test "update_question/1 returns changeset when data invalid" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Forum.update_question(question, @invalid_attrs)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Forum.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Forum.get_question!(question.id) end
    end

    test "change_question/1 returns question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Forum.change_question(question)
    end
  end
end
