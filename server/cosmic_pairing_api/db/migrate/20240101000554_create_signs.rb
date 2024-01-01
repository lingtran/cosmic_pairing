class CreateSigns < ActiveRecord::Migration[7.1]
  def change
    create_table :signs do |t|
      t.string :name
      t.integer :modality
      t.integer :element

      t.timestamps
    end
  end
end
