class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.datetime :date_from
      t.datetime :date_end
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :turn, foreign_key: true
      t.numeric :total

      t.timestamps
    end
  end
end
