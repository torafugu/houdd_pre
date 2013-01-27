class Moresmallbattleturn < ActiveRecord::Base
  belongs_to :moresmalltrialturn
  has_many :moresmallbattlelogs, :dependent => :delete_all

  def src_guard?
    def_squad_ids = Moresmalltrialsquadpers.find_all_by_mobunit_id_and_moresmalltrial_id(moresmalltrialturn.moresmalltrial.def_mobunit_id, moresmalltrialturn.moresmalltrial.id).collect{|s| s.squad_id}
    return true if def_squad_ids.include?(read_attribute(:src_squad_id))
    return false
  end

  def tgt_guard?
    def_squad_ids = Moresmalltrialsquadpers.find_all_by_mobunit_id_and_moresmalltrial_id(moresmalltrialturn.moresmalltrial.def_mobunit_id, moresmalltrialturn.moresmalltrial.id).collect{|s| s.squad_id}
    return true if def_squad_ids.include?(read_attribute(:tgt_squad_id))
    return false
  end
end
