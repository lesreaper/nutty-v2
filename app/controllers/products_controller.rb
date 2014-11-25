class ProductsController < ApplicationController

	before_action :prepare_redcarpet, :load_cart

  def index
    @get_nutty = true
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @title = @product.title
  end

  private

  def prepare_redcarpet
  	@redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

end
