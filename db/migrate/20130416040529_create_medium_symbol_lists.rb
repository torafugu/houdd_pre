class CreateMediumSymbolLists < ActiveRecord::Migration
  def change
    create_table :medium_symbol_lists do |t|
      t.string :category_sym
      t.string :symbol
      t.string :description

      t.timestamps
    end
  end
end
