class HomeController < ApplicationController
  def index
    @recents = UserItem.select("DISTINCT ON (item_id) user_items.*")
                   .order(:item_id, created_at: :desc)
                   .limit(3)
  end

  def about
  end
end
