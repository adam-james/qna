defmodule Qna.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :author_name, :string
      add :body, :text

      timestamps()
    end
  end
end
