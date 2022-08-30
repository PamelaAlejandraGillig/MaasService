class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.numeric :duration
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
