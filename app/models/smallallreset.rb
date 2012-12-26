class Mosttinyallreset
  def self.reset
    Mosttinyturn.destroy_all
    Mosttinymobtrail.destroy_all
    Mosttinybattle.destroy_all
    Mosttinytrial.update_all ['is_completed = ?', false]
    mobs = Mosttinymob.all(:include =>:mosttinymobinfo)
    mobs.each do |mob|
      mob.hp = mob.mosttinymobinfo.hp
      mob.is_dead = false
      mob.save
    end
    mobsetups = Mosttinymobsetup.all
    mobsetups.each do |mobsetup|
      mobsetup.current_x = mobsetup.start_x
      mobsetup.current_y = mobsetup.start_y
      mobsetup.save
    end
  end
end
