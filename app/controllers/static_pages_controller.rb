class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @post_pictures = @post.post_pictures.build
    end
  end
end
