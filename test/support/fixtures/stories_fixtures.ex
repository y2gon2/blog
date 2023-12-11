defmodule Blog.StoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Stories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Blog.Stories.create_story()

    # preload 를 test 에 정상적으로 구현되어 있지 않기 때문에 user, commets 정보를 제대로 가져올 수 없다.
    # 따라서 해당 부분을 임의의 빈값으로 생성하여 치환해줌
    story = %{story | comments: [], user: nil}
    story
  end
end
