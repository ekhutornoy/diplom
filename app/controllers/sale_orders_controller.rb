class SaleOrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  before_filter :only => [:new, :edit, :create, :update] do
    @departments = current_company.departments.all
    @products = current_company.products.all
    @product_options = @products.group_by(&:category).map { |c, g|
      [c.try(:name), g.map { |p| [p.name, p.id] }]
    }
    @department_options = @departments.map { |p| [p.name, p.id] }
  end

  # GET /sale_orders
  # GET /sale_orders.json
  def index
    @sale_orders = current_company.sale_orders.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_orders }
    end
  end

  # GET /sale_orders/1
  # GET /sale_orders/1.json
  def show
    @sale_order = current_company.sale_orders.find(params[:id])

    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @sale_order }
    end
  end

  # GET /sale_orders/new
  # GET /sale_orders/new.json
  def new
    @sale_order = SaleOrder.new
    @sale_order.sale_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale_order }
    end
  end

  # GET /sale_orders/1/edit
  def edit
    @sale_order = current_company.sale_orders.find(params[:id])
  end

  # POST /sale_orders
  # POST /sale_orders.json
  def create
    @sale_order = current_user.sale_orders.new(params[:sale_order])

    respond_to do |format|
      if @sale_order.save
        format.html { redirect_to sale_orders_path, notice: 'Sale order was successfully created.' }
        format.json { render json: @sale_order, status: :created, location: @sale_order }
      else
        format.html { render action: "new" }
        format.json { render json: @sale_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sale_orders/1
  # PUT /sale_orders/1.json
  def update
    @sale_order = current_company.sale_orders.find(params[:id])

    respond_to do |format|
      if @sale_order.update_attributes(params[:sale_order])
        format.html { redirect_to sale_orders_path, notice: 'Sale order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_orders/1
  # DELETE /sale_orders/1.json
  def destroy
    @sale_order = current_company.sale_orders.find(params[:id])
    @sale_order.destroy

    respond_to do |format|
      format.html { redirect_to sale_orders_url }
      format.json { head :no_content }
    end
  end
end
