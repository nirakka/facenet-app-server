class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.string :person1
      t.string :person2
      t.string :person1_path
      t.string :person2_path
      t.integer :score

      t.timestamps
    end
  end
end
