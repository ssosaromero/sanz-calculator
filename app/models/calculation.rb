# app/models/calculation.rb
class Calculation < ApplicationRecord
  serialize :arguments, Array
end
