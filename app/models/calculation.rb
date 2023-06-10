# app/models/calculation.rb
class Calculation < ApplicationRecord
  serialize :arguments, Array

  def calculate_result
    numeric_arguments = arguments.select { |arg| arg.is_a?(Numeric) }
    numeric_arguments.sum
  end

end
