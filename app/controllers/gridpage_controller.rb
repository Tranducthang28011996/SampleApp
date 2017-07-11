class GridpageController < ApplicationController
	def index
    if params[:first_price]
        @products = Product
        .where('price BETWEEN ? AND ?',params[:first_price],params[:last_price])
         @specialoffer = Product.all.limit(4).offset(rand(2))
         @categories = Category.all
         @color_product =  Product.all.map{|v| v.color}.compact.uniq
    elsif params[:category] 
         subcategories = Category.where(name: params[:category]).first.subcategories
         @products = subcategories.map { |k| k.products }.flatten
         @specialoffer = Product.all.limit(4).offset(rand(2))
         @categories = Category.all
         @color_product =  Product.all.map{|v| v.color}.compact.uniq
         session[:category]= params[:category]
    elsif params[:color] && session[:category]
         subcategories = Category.where(name: session[:category]).first.subcategories
         @products = subcategories.map { |k| k.products.where(color: params[:color] ) }.flatten
         byebug
         @specialoffer = Product.all.limit(4).offset(rand(2))
         @categories = Category.all
         @color_product =  Product.all.map{|v| v.color}.compact.uniq
     else 
		 @products = Product.all
		 @specialoffer = Product.all.limit(4).offset(rand(2))
         @categories = Category.all
         @color_product =  Product.all.map{|v| v.color}.compact.uniq
   end
	end
end
