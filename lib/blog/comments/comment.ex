defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :message, :string
    belongs_to :story, Blog.Stories.Story
    belongs_to :user, Blog.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message, :story_id, :user_id])
    |> validate_required([]) # 만약 회원들만 comment 남기는 것을 허용하고자할 경우 :user_id 를 추가하는 것이 안전함.
                                    # test 조건에서 :message, :story_id 가 없는 상태일 때 comment 추가 가능하도록 해당 atom 삭제?
    # case
    # 1st argument: comment - 해당 schema 함수를 통해 생성된 구조체. 해당 구조체에 data 를 담아 영속성 처리를 한다.
    # 2nd argument: attrs - logic 작업으로 전달 받은 data.
    # 3rd argument: list - 리스트 내 변경 하고자 하는 필드 목록
    # -> arrts 값들 중 list 내 해당 하는 목록의 data 가 존재할 경우 이에 해당하는 comment 구조체를 생성한다.

    # validate_required
    # 특정 필드들이 not null 상태 임을 확인한다. 만약 해당 필드값이 존재하지 않을 경우 처리되지 않는다.

  end
end
