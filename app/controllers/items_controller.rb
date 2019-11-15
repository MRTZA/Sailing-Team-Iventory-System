class ItemsController < ApplicationController
  def item_params
    params.require(:item).permit(:title, :checked_out, :user, :date, :condition)
  end

  def index
    @items = Item.all
  end

  def show
    id = params[:id]
    @items = Item.find(id)
  end

  def new
  end

  def edit
    @item = Item.find params[:id]
  end

  def create
    @item = Item.create!(item_params)
    flash[:notice] = "#{@item.title} was successfully created."
    redirect_to items_path
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.title} was successfully updated."
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' deleted."
    redirect_to items_path
  end
end
