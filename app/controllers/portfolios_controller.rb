class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

    def new
      @portfolio_item = Portfolio.new

    end
  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item is now live!' }

      else
        format.html { render :new}
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(parms[:id])
  end

  def update
    @portfolio_item = Portfolio.find(parms[:id])
    respond_to do |format|
      if @portfolio_item.update(blog_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio Item was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

end

