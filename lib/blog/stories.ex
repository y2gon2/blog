defmodule Blog.Stories do
  @moduledoc """
  The Stories context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.Stories.Story

  @doc """
  Returns the list of stories.

  ## Examples

      iex> list_stories()
      [%Story{}, ...]

  """
  def list_stories do
    Repo.all(Story) |> Repo.preload([:user, :comments]) # test 에서 :comment 추가 preload 조건 확인됨
  end

  def list_stories(user_id) do
    Repo.all(from s in Story, where: s.user_id == ^user_id)
    # `from s in Story, where: s.user_id == ^user_id` Ecto query 구문
    # 가져온 각각의 Story data 를 "s" 로 지칭.
    # 해당 data 에 user_id column 값이 매개변수로 받은 값과 일치하는 record 들만 반환
  end

  @doc """
  Gets a single story.

  Raises `Ecto.NoResultsError` if the Story does not exist.

  ## Examples

      iex> get_story!(123)
      %Story{}

      iex> get_story!(456)
      ** (Ecto.NoResultsError)

  """
  def get_story!(id) do
    Repo.get!(Story, id)
    |> Repo.preload([:user, :comments]) # sthory.ex 에 해당 association 설정으로 바로 사용 가능. has_many :comments, Comment, on_delete: :delete_all
    |> Repo.preload(comments: :user) # 글읽기 에서 comment 작성자 정보를 가져와서 노출 시킬 수 있도록
  end

  def get_story!(id, user_id) do
    Repo.one(from s in Story, where: s.id == ^id and s.user_id == ^user_id)
  end

  @doc """
  Creates a story.

  ## Examples

      iex> create_story(%{field: value})
      {:ok, %Story{}}

      iex> create_story(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_story(attrs \\ %{}) do
    %Story{}
    |> Story.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a story.

  ## Examples

      iex> update_story(story, %{field: new_value})
      {:ok, %Story{}}

      iex> update_story(story, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_story(%Story{} = story, attrs) do
    story
    |> Story.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a story.

  ## Examples

      iex> delete_story(story)
      {:ok, %Story{}}

      iex> delete_story(story)
      {:error, %Ecto.Changeset{}}

  """
  def delete_story(%Story{} = story) do
    Repo.delete(story)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking story changes.

  ## Examples

      iex> change_story(story)
      %Ecto.Changeset{data: %Story{}}

  """
  def change_story(%Story{} = story, attrs \\ %{}) do
    Story.changeset(story, attrs)
  end
end
