class Smallmobunit < ActiveRecord::Base
  belongs_to :smalluser
  belongs_to :smallstrategy
  belongs_to :smallmap
  has_many :smallmobsquads

  def squad_names
    smallsquads.collect{|m| m.name}.join(', ')
  end

  def squad_ids
    @squad_ids || smallmobsquads.collect{|m| m.id}
  end

  def squad_ids=(id_array)
    @squad_ids = id_array.collect{|id| id.to_i};
  end

  after_save :assign_squads

  private

  def assign_squads
    if @squad_ids
      new_ids = @squad_ids
      old_ids = smallmobsquads.collect{|m| m.id}
      ids_to_delete = old_ids - (old_ids & new_ids)
      ids_to_add = new_ids - (old_ids & new_ids)
      smallmobunit_id = id
 
      ids_to_delete.each do |squad_id|
        Smallmobsquad.find(squad_id).update_attribute(:smallmobunit_id, nil)
      end
 
      ids_to_add.each do |squad_id|
        unless squad_id == 0
          Smallmobsquad.find(squad_id).update_attribute(:smallmobunit_id ,smallmobunit_id)
        end
      end
    end
  end
end
