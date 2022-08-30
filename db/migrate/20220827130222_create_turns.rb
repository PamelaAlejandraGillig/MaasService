class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.json :period
      t.integer :week
      t.belongs_to :contract, foreign_key: true

      t.timestamps
    end
  end
end
