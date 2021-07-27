class CategoriesController < ApplicationController
  def index
    @leagues = League.all
  end
end
