class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
