class ProductsController < ApplicationController

	def index
		@products = Product.all
		render :index
	end

	def new
		@product = Product.new
	end

	def create
  		#render plain: params[:product].inspect
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
		render :edit
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
		    redirect_to root_path
		else
		    render 'edit'
		end
	end



	
	def destroy
		@product = Product.find(params[:id])
  		@product.destroy
  		redirect_to root_path		
	end


	def show
		@product = Product.find(params[:id])
	end



	private
		def product_params
			params.require(:product).permit(:name, :description, :price, :published)	
		end

end
