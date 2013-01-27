class Moresmallbattlelog < ActiveRecord::Base
  belongs_to :moresmallbattleturn

  def src_guard?
    guard_squad_id = moresmallbattleturn.src_squad_id
    guard_squad_id = moresmallbattleturn.tgt_squad_id if moresmallbattleturn.tgt_guard?

    guard_mob_ids = Moresmalltrialsquadpers.find_by_squad_id_and_moresmalltrial_id(guard_squad_id, moresmallbattleturn.moresmalltrialturn.moresmalltrial.id).moresmalltrialmobperss.collect{|s| s.mob_id}
    return true if guard_mob_ids.include?(read_attribute(:src_mob_id))
    return false
  end

  def tgt_guard?
    guard_squad_id = moresmallbattleturn.src_squad_id
    guard_squad_id = moresmallbattleturn.tgt_squad_id if moresmallbattleturn.tgt_guard?

    guard_mob_ids = Moresmalltrialsquadpers.find_by_squad_id_and_moresmalltrial_id(guard_squad_id, moresmallbattleturn.moresmalltrialturn.moresmalltrial.id).moresmalltrialmobperss.collect{|s| s.mob_id}
    return true if guard_mob_ids.include?(read_attribute(:tgt_mob_id))
    return false
  end

end
