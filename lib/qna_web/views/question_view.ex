defmodule QnaWeb.QuestionView do
  use QnaWeb, :view
  alias QnaWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{id: question.id,
      author_name: question.author_name,
      body: question.body}
  end
end
