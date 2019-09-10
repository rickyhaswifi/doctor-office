class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :author
      t.belongs_to :physician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
