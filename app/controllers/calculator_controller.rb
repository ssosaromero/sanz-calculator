class CalculatorController < ApplicationController

  class CalculatorController < ApplicationController
    def index
      # Render the form view
    end

    # def calculate
    #   arguments = params[:calc][:arg]
    #   numeric_args = arguments.select { |arg| arg.to_i.to_s == arg || arg.to_f.to_s == arg }
    #   result = numeric_args.sum(&:to_f)

    #   # Save the query and result in the database
    #   Calculation.create(arguments: arguments, result: result)

    #   render plain: "Result: #{result}"
    # end

    def calc
      arguments = params[:calc].values.map(&:to_f)
      numerical_arguments = arguments.select { |arg| arg.to_s =~ /^[0-9]+(\.[0-9]+)?$/ }

      sum = numerical_arguments.sum

      render plain: "Result: #{sum}"
    end


    def history
      previous_queries = Calculation.all
      render json: previous_queries
    end

  end



end
