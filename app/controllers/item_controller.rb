class ItemController < ApplicationController

  def item_params
    params.require(:item).permit(:title, :description, :checked_out, :quantity)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @item = Item.order(sort_column + " " + sort_direction)
  end

  def new
    # default: render 'new' template
  end

  def create
    @item = Item.create!(item_params)
    flash[:notice] = "#{@item.title} was successfully created."
    redirect_to item_path
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.title} was successfully updated."
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @Item.destroy
    flash[:notice] = "Item '#{@item.title}' deleted."
    redirect_to item_path
  end

  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
