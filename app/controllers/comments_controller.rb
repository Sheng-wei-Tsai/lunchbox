class CommentsController < ApplicationController
  def create
    redirect_to root_path, notice: 'ok'
  end
end
