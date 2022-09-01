class InventoriesController < ApplicationController
  def index
    @inventories = if current_user.nil?
                     []
                   else
                     @current_user.inventories
                   end
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def create
    @user = current_user
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = @user.id
    respond_to do |format|
      format.html do
        if @inventory.save
          flash[:success] = 'Inventory saved successfully'
          redirect_to inventories_path
        else
          flash[:error] = 'Error: Inventory could not be saved'
          redirect_to new_inventory_url(@user)
        end
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = 'Inventory was deleted successfully.'
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :string)
  end
end
