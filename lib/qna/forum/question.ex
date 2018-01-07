defmodule Qna.Forum.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias Qna.Forum.Question


  schema "questions" do
    field :author_name, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:author_name, :body])
    |> validate_required([:author_name, :body])
  end
end
