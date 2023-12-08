defmodule Blog.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :body, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body])
  end
  # changeset/2 에 대하여 (by ChatGPT)
  #
  # changeset/2 함수의 cast/3 호출에 :user_id를 추가한 것은, 데이터베이스에 저장되는 데이터를 결정하는 중요한 단계입니다.
  # changeset/2 함수는 데이터의 유효성 검증 및 변환을 담당하며, 어떤 필드가 데이터베이스에 저장될 것인지도 결정합니다.
  # 여기서 중요한 것은 cast/3 함수와 Repo 모듈 함수의 역할이 다르다는 점입니다:
  #
  # cast/3 함수의 역할: cast/3 함수는 주어진 attrs 맵에서 지정된 필드(여기서는 :title, :body, :user_id)를 추출하고,
  # 이들을 새로운 또는 기존의 changeset에 적용합니다. 이 과정에서 각 필드의 데이터 타입을 확인하고, 필드가 changeset에
  # 올바르게 포함되도록 합니다. cast/3를 통해 지정된 필드만이 데이터베이스에 저장될 수 있습니다.
  #
  # Repo 모듈 함수의 역할: Repo.insert/2, Repo.update/2와 같은 함수들은 changeset을 받아 실제로 데이터베이스에
  # 데이터를 삽입하거나 수정합니다. 이 함수들은 changeset에 포함된 데이터를 바탕으로 작동하며,
  # changeset에 없는 데이터는 데이터베이스에 영향을 주지 않습니다.
  #
  # changeset/2 함수에 :user_id를 추가함으로써, :user_id 필드가 changeset에 포함되고, 따라서 Repo 모듈 함수를 사용할 때
  # :user_id도 데이터베이스에 저장됩니다. Repo 모듈 함수는 changeset에 포함된 데이터를 그대로 사용하기 때문에,
  # changeset에서 어떤 데이터가 포함되거나 제외되는지가 매우 중요합니다.
  #
  # 즉, 데이터베이스에 저장되는 데이터를 변경하기 위해서는 Repo 모듈 함수를 변경하는 것이 아니라, 해당 데이터가 포함된
  # changeset을 수정해야 합니다. changeset에서 어떤 필드를 캐스팅하고 검증하는지 결정하는 것이
  ## 바로 데이터베이스에 어떤 데이터가 저장될지 결정하는 핵심 단계입니다.



end
