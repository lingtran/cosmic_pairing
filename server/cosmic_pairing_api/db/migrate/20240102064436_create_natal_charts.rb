class CreateNatalCharts < ActiveRecord::Migration[7.1]
  def change
    create_table :natal_charts do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
