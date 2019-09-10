class AddRoleToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :role, :string
  end
end
