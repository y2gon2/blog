defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :message, :string
    belongs_to :story, Blog.Stories.Story

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message, :story_id])
    |> validate_required([:message, :story_id])
  end
end
