class CalculatorController < ApplicationController
  def index
    @calculations = Calculation.all
  end

  # def calculate
  #   arguments = params[:calc][:arg].values.reject(&:blank?)
  #   result = calculate_sum(arguments)
  #   save_calculation(arguments, result)

  #   render plain: result.to_s
  # end

  def calculate
    arguments = calculation_params[:arguments].reject(&:blank?)
    result = arguments.map(&:to_f).sum

    calculation = Calculation.create(arguments: arguments, result: result)

    if calculation.persisted?
      render json: calculation
    else
      render json: { error: "Failed to save calculation" }, status: :unprocessable_entity
    end
  end


  def history
    calculations = Calculation.all
    render json: calculations
  end

  private

  def calculate_sum(arguments)
    numeric_arguments = arguments.map(&:to_f)
    sum = numeric_arguments.sum
    sum.round(2) # Round the sum to 2 decimal places
  end

  def save_calculation(arguments, result)
    calculation = Calculation.create(arguments: arguments, result: result)
    calculation.save
  end
end
