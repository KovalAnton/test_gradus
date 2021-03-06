require 'builder'
require 'will_paginate'
include ActionView::Helpers::NumberHelper

class OrdersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
  #   @filterrific = initialize_filterrific(
  #     Order,
  #     params[:filterrific],
  #     select_options: {
  #       whith_price: Order.options_for_select
  #     },
  #   ) or return
    
  #   @orders = @filterrific.find.page(params[:page])
  # end

    if request.xhr?
      @orders = Order.where(lat: params[:south]...params[:north], lng: params[:west]...params[:east])
      render partial: 'orders'
    else
      @orders = Order.all
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
      if @order.save
        @order.update_attributes(email_user: current_user.email)
      end


    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        puts @order.errors.full_messages
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :description, :convenience, :price, :address, :image, :retained_image, :remove_image, :lat, :lng, :email_user)
    end
end
