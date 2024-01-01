class ChangeCelestialsToRepresentSingleTableInheritance < ActiveRecord::Migration[7.1]
  # source: https://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html
  def change
    add_column :celestials, :type, :string, default: "Planet", null: false
    change_column_null :celestials, :name, false
  end
end
