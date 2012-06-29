class DeclarationCategoriesController < ApplicationController
  def index
    @categories = DeclarationCategory.main
  end
end