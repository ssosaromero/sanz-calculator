# app/controllers/calculator_controller.rb

class CalculatorController < ApplicationController
  def calc
    operator = params[:calculator][:operator]
    arguments = params[:calculator][:arguments] || []

    numerical_arguments = arguments.select { |arg| arg.is_a?(Numeric) }

    result = case operator
             when '+'
               numerical_arguments.sum
             when '-'
               numerical_arguments.reduce(:-)
             when '*'
               numerical_arguments.reduce(:*)
             when '/'
               numerical_arguments.reduce(:/)
             else
               nil
             end

    Calculation.create(operator: operator, arguments: arguments, result: result)

    render json: { result: result }
  end

  def history
    calculations = Calculation.all
    render json: { history: calculations }
  end
end
