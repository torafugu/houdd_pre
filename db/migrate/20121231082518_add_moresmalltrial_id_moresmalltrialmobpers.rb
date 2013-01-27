class AddMoresmalltrialIdMoresmalltrialmobpers < ActiveRecord::Migration
  def change
    add_column :moresmalltrialmobpers, :moresmalltrial_id, :integer
    add_index :moresmalltrialmobpers, :moresmalltrial_id
  end
end
