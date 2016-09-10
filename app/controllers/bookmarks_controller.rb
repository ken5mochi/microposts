class BookmarksController < ApplicationController
  before_action :logged_in_user
  
  def create
    @target_micropost = Micropost.find(params[:micropost_id])
    current_user.add_bookmark(@target_micropost)
    redirect_to :back
  end
  
  def destroy
    @target_micropost = current_user.bookmarks.find(params[:id]).micropost
    current_user.delete_bookmark(@target_micropost)
    redirect_to :back
  end
end
