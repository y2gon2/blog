defmodule BlogWeb.StoryLive.Show do
  use BlogWeb, :live_view

  alias Blog.Stories
  alias Blog.Comments.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, comment: %Comment{})}
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
