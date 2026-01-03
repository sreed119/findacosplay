class HomeController < ApplicationController
  def index
    @recents = UserItem.order(created_at: :desc).limit(3)
  end

  def about
  end
end
