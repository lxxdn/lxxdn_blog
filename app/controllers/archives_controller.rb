class ArchivesController < ApplicationController
  def index
    @archives = Post.order('created_at DESC')
  end
end
