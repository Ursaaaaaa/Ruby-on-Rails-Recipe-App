class InventoriesController < ApplicationController
  def index
    @recipes = if current_user.nil?
                     []
                   else
                     @current_user.recipes
                   end
  end
  def new
    @inventory = Inventory.new
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def create
    user = current_user
    inventory = Inventory.new(params.require(:inventory).permit(:name))
    
    respond_to do |format|
      format.html do
        if inventory.save
          flash[:success] = 'Inventory saved successfully'
          redirect_to invetories_url
        else
          flash[:error] = 'Error: Inventory could not be saved'
          redirect_to new_inventory_url
        end
      end
    end
  end

  private
  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
