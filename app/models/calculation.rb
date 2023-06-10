# app/models/calculation.rb

class Calculation < ApplicationRecord
  serialize :arguments, Array # Specify the arguments attribute as an array

  validates :arguments, presence: true
end
