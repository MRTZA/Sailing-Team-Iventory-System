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
    @sort = params[:sort] || session[:sort]
    #Ratings that are selected
    @checked_options = params[:options] || session[:options] ||
      Hash[ItemHelper.all_options.map {|k| [k, true]}]
    #ALL ratings
    @all_ratings = Hash[ItemHelper.all_options.map {|k| [k, @checked_options.key?(k)]}]
    # Remembers the session - did this in Part 2. Didn't realize this would be
    # part of Part 3 when I looked into doing the checkboxes and updating the list based on them.
    # So I had already used [session] for the sort and ratings.
    session[:sort] = @sort
    session[:ratings] = @checked_options
    if !params[:sort] && !params[:options]
      flash.keep
      redirect_to item_path(:options => @checked_options, :sort => @sort) and return
    end
    @item = Item.where(:options => @checked_options.keys).order @sort
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
    @item.destroy
    flash[:notice] = "Movie '#{@item.title}' deleted."
    redirect_to item_path
  end

end

