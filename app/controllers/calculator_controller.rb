class CalculatorController < ApplicationController
  def index
    @calculations = Calculation.all
  end

  def calculate
    arguments = params[:calc] || []

    calculation = Calculation.new(arguments: arguments)
    result = calculation.calculate_result

    if calculation.save
      render plain: result.to_s
    else
      render plain: "Error saving calculation"
    end
  end

  # def calculate
  #   @calculation = Calculation.create(arguments: params[:calc])

  #   render plain: @calculation.result

  #   # Save the calculation to the history
  #   session[:history] ||= []
  #   session[:history] << @calculation.id
  # end

  def history
    calculations = Calculation.last(3)
    render json: calculations.reverse, only: [:arguments, :result]
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
