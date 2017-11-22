class ChangeScoreType < ActiveRecord::Migration[5.1]
  def change
    change_column :rankings, :score, :float
  end
end
