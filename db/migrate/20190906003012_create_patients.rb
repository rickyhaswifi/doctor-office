class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.string :phone_number

      t.timestamps
    end
  end
end
