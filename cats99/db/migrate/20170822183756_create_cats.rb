class CreateCats < ActiveRecord::Migration[5.1]
  COLORS = ['white', 'black', 'tabby', 'calico', 'orange']
  def change
    create_table :cats do |t|
      t.date :birthdate, null: false
      t.string :color, inclusion: { in: COLORS }, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, inclusion: { in: %w(m f) }, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
