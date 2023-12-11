defmodule Blog.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{

      })
      |> Blog.Comments.create_comment()

    comment
  end

  # @doc """
  # Generate a comment.
  # """
  # def comment_fixture(attrs \\ %{}) do
  #   {:ok, comment} =
  #     attrs
  #     |> Enum.into(%{
  #       message: "some message"
  #     })
  #     |> Blog.Comments.create_comment()

  #   comment
  # end
end
