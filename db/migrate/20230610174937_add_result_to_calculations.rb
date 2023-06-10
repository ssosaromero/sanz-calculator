class AddResultToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculations, :result, :string
  end
end
