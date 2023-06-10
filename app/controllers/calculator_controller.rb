class CalculatorController < ApplicationController
  def index
    @calculations = Calculation.all
  end

  # def calculate
  #   arguments = params[:calc] || []

  #   calculation = Calculation.new(arguments: arguments)
  #   result = calculation.calculate_result

  #   if calculation.save
  #     render plain: result.to_s
  #   else
  #     render plain: "Error saving calculation"
  #   end
  # end
  def calculate
    arguments = params[:calc].reject(&:blank?)
    sum = arguments.map(&:to_f).sum

    calculation = Calculation.create(arguments: arguments, result: sum)

    if calculation.valid?
      render plain: "Calculation saved successfully"
    else
      render plain: "Failed to save calculation"
    end
  end



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
