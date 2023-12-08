defmodule BlogWeb.StoryLive.Home do
  use BlogWeb, :live_view

  alias Blog.Stories

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :stories, Stories.list_stories())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :home, _params) do
    socket
    |> assign(:page_title, "Listing Stories")
    |> assign(:story, nil)
  end
end
