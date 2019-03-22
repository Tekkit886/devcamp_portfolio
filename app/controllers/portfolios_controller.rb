class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end

    def angular
      @angular_portfolio_items = Portfolio.angular
    end

    def new
      @portfolio_item = Portfolio.new
    end


  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item is now live!' }

      else
        format.html { render :new}
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
    
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_url, notice: 'Record was removed!' }

    end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:id, :name, :_destroy]
                                        )

    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
