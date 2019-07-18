class SearchController < ApplicationController
  def articles
    @articles = Article._search_(params[:page], params[:term])
  end
end
