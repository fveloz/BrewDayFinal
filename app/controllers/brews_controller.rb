class BrewsController < ApplicationController
  def index
  	@brews = Brew.order("created_at desc")
  end

  def new
  	@brew = Brew.new
  	@brew.hops.build
    @brew.fermentables.build
    @brew.yeasts.build
    @brew.extras.build
  end

  def show
  	@brew = Brew.find params[:id]
  end

  def edit
    @brew = Brew.find params[:id]
  end

  def create
  	@brew = Brew.new(brew_params)
    @brew.user = User.find(current_user.id)
   	if @brew.save
   		redirect_to @brew
   	else
   		render 'new'
   	end
  end

 def update
  @brew = Brew.find params[:id]
  @brew.update(brew_params)
  redirect_to @brew
 end

def destroy
    @brew = Brew.find params[:id]
    @brew.destroy
    redirect_to root_path
end

private 
  def brew_params
  	params.require('brew').permit(:name, :story, :walkthrough, hops_attributes: [:name, :id, :brew_id], 
      extras_attributes: [:name, :id, :brew_id], fermentables_attributes: [:name, :id, :brew_id], 
      yeasts_attributes: [:name, :id, :brew_id])
  end
end
