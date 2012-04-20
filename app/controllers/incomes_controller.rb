class
 IncomesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :only => [:new, :edit] do
    @departments = current_company.departments.all
    @products = current_company.products.all
    @product_options = @products.group_by(&:category).map { |c, g|
      [c.try(:name), g.map { |p| [p.name, p.id] }]
    }
  end

  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = current_company.incomes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomes }
    end
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @income = current_company.incomes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income }
    end
  end

  # GET /incomes/new
  # GET /incomes/new.json
  def new
    @income = Income.new
    @income.income_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income }
    end
  end

  # GET /incomes/1/edit
  def edit
    @income = current_company.incomes.find(params[:id])
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = current_user.incomes.new(params[:income])

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render json: @income, status: :created, location: @income }
      else
        format.html { render action: "new" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incomes/1
  # PUT /incomes/1.json
  def update
    @income = current_company.incomes.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(params[:income])
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income = current_company.incomes.find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  end
end
