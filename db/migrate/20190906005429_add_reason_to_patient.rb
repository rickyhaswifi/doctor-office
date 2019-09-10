class AddReasonToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :reason, :text
  end
end
