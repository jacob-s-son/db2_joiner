class DeclarationStatementsController < ApplicationController
  respond_to :json
  
  def index
    respond_with DeclarationStatement.find_by_declaration_category_id(params[:declaration_category_id])
  end
end