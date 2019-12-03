class ItemsController < ApplicationController
  def item_params
    params.require(:item).permit(:title, :checked_out, :user, :date, :condition)
  end

  def index
    if current_user.nil?
      redirect_to sign_up_path
    end
    @items = Item.all
  end

  def show
    id = params[:id]
    @items = Item.find(id)
    authorize! :read, @item
  end

  def new
  end

  def edit
    @item = Item.find params[:id]
    authorize! :update, @item
  end

  def create
    @item = Item.create!(item_params)
    flash[:notice] = "#{@item.title} was successfully created."
    redirect_to items_path
    authorize! :create, @item
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.title} was successfully updated."
    redirect_to items_path
    authorize! :update, @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' deleted."
    redirect_to items_path
    authorize! :delete, @item
  end

  def check_out
    @item = Item.find(params[:id])
    if @item.checked_out == 0
      @item.update_attributes!({:user => current_user.username, :checked_out => 1, :date => DateTime.now})
    else
      @item.update_attributes!({:user => current_user.username, :checked_out => 0, :date => DateTime.now})
    end

    @user = current_user
    ModelMailer.checkout_notification(@item, @user).deliver

    redirect_to items_path
  end
end
