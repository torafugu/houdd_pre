class Moresmallmobunit < ActiveRecord::Base
  belongs_to :moresmalluser
  belongs_to :moresmallstrategy
  belongs_to :cur_map, :class_name => 'Moresmallmap', :foreign_key => 'cur_map_id'
  belongs_to :tgt_map, :class_name => 'Moresmallmap', :foreign_key => 'tgt_map_id'
  has_many :moresmallmobsquads

  def squad_names
    moresmallsquads.collect{|m| m.name}.join(', ')
  end

  def squad_ids
    @squad_ids || moresmallmobsquads.collect{|m| m.id}
  end

  def squad_ids=(id_array)
    @squad_ids = id_array.collect{|id| id.to_i};
  end

  def guard?
    if read_attribute(:cur_map_id) == read_attribute(:tgt_map_id)
      return true
    else
      return false
    end
  end

  after_save :assign_squads

  private

  def assign_squads
    if @squad_ids
      new_ids = @squad_ids
      old_ids = moresmallmobsquads.collect{|m| m.id}
      ids_to_delete = old_ids - (old_ids & new_ids)
      ids_to_add = new_ids - (old_ids & new_ids)
      moresmallmobunit_id = id
 
      ids_to_delete.each do |squad_id|
        Moresmallmobsquad.find(squad_id).update_attribute(:moresmallmobunit_id, nil)
      end
 
      ids_to_add.each do |squad_id|
        unless squad_id == 0
          Moresmallmobsquad.find(squad_id).update_attribute(:moresmallmobunit_id ,moresmallmobunit_id)
        end
      end
    end
  end
end
