defmodule Qna.Forum do
  @moduledoc """
  The Forum context.
  """

  import Ecto.Query, warn: false
  alias Qna.Repo

  alias Qna.Forum.Question

  @doc """
  Returns a list of questions.

  ## Examples

    iex> list_questions()
    [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the question does not exist.

  ## Exampls
 
    iex> get_question!(123)
    %Question{}

    iex> get_question!(456)
    ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.
  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.
  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.
  """
  def delete_question(question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `Ecto.Changeset` for tracking question changes.
  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end
end
