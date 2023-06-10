class CalculatorController < ApplicationController

  class CalculatorController < ApplicationController
    def index
      # Render the form view
    end

    def calculate
      arguments = params[:calc][:arg]
      numeric_args = arguments.select { |arg| arg.to_i.to_s == arg || arg.to_f.to_s == arg }
      result = numeric_args.sum(&:to_f)

      # Save the query and result in the database
      Calculation.create(query: arguments, result: result)

      render plain: "Result: #{result}"
    end
  end



end