class BudgetsController < ApplicationController

  before_action :set_budget, only: [:show, :edit, :update, :destroy]




  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.where(:session => $sess_name)

  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show


    @budget = Budget.find(params[:id])
    @incomev = 			    @budget.income
    @savingv = 			    @budget.income * 0.05 unless  @budget.income.nil?
    @housingv = 		    @budget.income * 0.24 unless  @budget.income.nil?
    @utilitiev = 		    @budget.income * 0.05 unless  @budget.income.nil?
    @foodv = 			      @budget.income * 0.08 unless  @budget.income.nil?
    @transportationv =  @budget.income * 0.09 unless  @budget.income.nil?
    @clothingv = 		    @budget.income * 0.07 unless  @budget.income.nil?
    @personalv = 		    @budget.income * 0.09 unless  @budget.income.nil?
    @recreationv = 	  	@budget.income * 0.09 unless  @budget.income.nil?
    @debtv = 			      @budget.income * 0.09 unless  @budget.income.nil?
    @kidv = 			      @budget.income * 0.18 unless  @budget.income.nil?

    @savingx =          @budget.savings
    @housingx =         @budget.housing
    @utilitiex =        @budget.utilities
    @foodx =          	@budget.food
    @transportationx =  @budget.transportation
    @clothingx =        @budget.clothing
    @personalx =        @budget.personal
    @recreationx =      @budget.recreation
    @debtx =            @budget.debt
    @kidx =             @budget.kids





    @total_suggested = @savingv + @housingv + @utilitiev  + @foodv + @transportationv + @clothingv + @personalv  + @recreationv +  @debtv  + @kidv
    @total_actual = @savingx + @housingx + @utilitiex  + @foodx + @transportationx + @clothingx + @personalx  + @recreationx + @debtx  + @kidx


    if @savingv > @savingx

      @savingz = (@savingv - @savingx)
    else
      @savingz = (@savingx - @savingv)
    end


    if @housingv > @housingx

      @housingz = (@housingv - @housingx)
    else
      @housingz = (@housingx - @housingv)
    end


    if @utilitiev > @utilitiex

      @utilitiez = (@utilitiev - @utilitiex)
    else
      @utilitiez = (@utilitiex - @utilitiev)
    end


    if @foodv > @foodx
      @foodz = (@foodv - @foodx)
    else
      @foodz = (@foodx - @foodv)
    end


    if @transportationv > @transportationx
      @transportationz = (@transportationv - @transportationx)
    else
      @transportationz = (@transportationx - @transportationv)
    end

    if @clothingv > @clothingx
      @clothingz = (@clothingv - @clothingx)
    else
      @clothingz = (@clothingx - @clothingv)
    end


    if @personalv > @personalx
      @personalz = (@personalv - @personalx)
    else
      @personalz = (@personalx - @personalv)
    end

    if @recreationv > @recreationx
      @recreationz = (@recreationv - @recreationx)
    else
      @recreationz = (@recreationx - @recreationv)
    end

    if @debtv > @debtx
      @debtz = (@debtv - @debtx)
    else
      @debtz = (@debtx - @debtv)
    end

    if @kidv > @kidx
      @kidz = (@kidv - @kidx)
    else
      @kidz = (@kidx - @kidv)
    end

  end




  # GET /budgets/new
  def new
    @budget = Budget.new

  end





  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:income, :savings, :housing, :utilities, :food, :food, :transportation, :clothing, :personal, :recreation, :debt, :kids, :session, :budget_name)
    end


end
