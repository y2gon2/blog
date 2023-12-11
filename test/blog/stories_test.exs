defmodule Blog.StoriesTest do
  use Blog.DataCase

  alias Blog.Stories

  describe "stories" do
    alias Blog.Stories.Story

    import Blog.StoriesFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Stories.list_stories() == [story]
    end
#     left:  [
#       %Blog.Stories.Story{
#         __meta__: #Ecto.Schema.Metadata<:loaded, "stories">,
#         id: 235,
#         body: "some body",
#         title: "some title",
#         user_id: nil,
#         user: nil,
#         comments: #Ecto.Association.NotLoaded<association :comments is not loaded>, =>  preload 설정에 comment 값도 추가해주어야?
#         inserted_at: ~N[2023-12-11 05:54:51],
#         updated_at: ~N[2023-12-11 05:54:51]
#       }
#     ]
# right: [
#       %Blog.Stories.Story{
#         __meta__: #Ecto.Schema.Metadata<:loaded, "stories">,
#         id: 235,
#         body: "some body",
#         title: "some title",
#         user_id: nil,
#         user: nil,
#         comments: [],
#         inserted_at: ~N[2023-12-11 05:54:51],
#         updated_at: ~N[2023-12-11 05:54:51]
#       }
#     ]

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Stories.get_story!(story.id) == story

      # left:  %Blog.Stories.Story{
      #   __meta__: #Ecto.Schema.Metadata<:loaded, "stories">,
      #   id: 169,
      #   body: "some body",
      #   title: "some title",
      #   user_id: nil,
      #   user: nil,
      #   comments: [],
      #   inserted_at: ~N[2023-12-11 05:23:24],
      #   updated_at: ~N[2023-12-11 05:23:24]
      #   }

      # right: %Blog.Stories.Story{
      #   __meta__: #Ecto.Schema.Metadata<:loaded, "stories">,
      #   id: 169,
      #   body: "some body",
      #   title: "some title",
      #   user_id: nil,
      #   user: #Ecto.Association.NotLoaded<association :user is not loaded>,  => preload 가 test 에서 정상적으로 구현되지 않은 상태이기 때문에 에러 발생
      #   comments: #Ecto.Association.NotLoaded<association :comments is not loaded>,  => preload 가 test 에서 정상적으로 구현되지 않은 상태이기 때문에 에러 발생
      #   inserted_at: ~N[2023-12-11 05:23:24],
      #   updated_at: ~N[2023-12-11 05:23:24]
      # }
    end

    test "create_story/1 with valid data creates a story" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Story{} = story} = Stories.create_story(valid_attrs)
      assert story.body == "some body"
      assert story.title == "some title"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Story{} = story} = Stories.update_story(story, update_attrs)
      assert story.body == "some updated body"
      assert story.title == "some updated title"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_story(story, @invalid_attrs)
      assert story == Stories.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Stories.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Stories.change_story(story)
    end
  end
end
