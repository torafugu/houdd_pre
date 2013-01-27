class RemoveindexMoresmalltrialIdMoresmalltrialmobpers < ActiveRecord::Migration
  def change
    remove_index :moresmalltrialmobpers, :moresmalltrial_id
  end
end
