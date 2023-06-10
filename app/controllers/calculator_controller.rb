class CalculatorController < ApplicationController

  class CalculatorController < ApplicationController
    def index
      # Render the form view
    end

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
