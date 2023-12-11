defmodule BlogWeb.StoryLive.Show do
  use BlogWeb, :live_view

  alias Blog.Stories
  alias Blog.Comments.Comment

  @impl true
  def mount(_params, _session, socket) do
    current_user_id = if socket.assigns[:current_user] do
      socket.assigns[:current_user].id
    else
      nil
    end
    {:ok, assign(socket, comment: %Comment{}, current_user_id: current_user_id)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:story, Stories.get_story!(id))}
  end

  defp page_title(:show), do: "Show Story"
  defp page_title(:edit), do: "Edit Story"
end
