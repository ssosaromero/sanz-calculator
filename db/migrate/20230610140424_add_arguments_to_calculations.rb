class AddArgumentsToCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :calculations, :arguments, :text
  end
end
