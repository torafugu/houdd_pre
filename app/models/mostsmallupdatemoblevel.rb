class Mostsmallupdatemoblevel
  def self.execute
    Mostsmallmob.all.each do |mob|
      next if mob.dead?
      case mob.level
      when 1
        level_up(mob) if mob.battle_exp > 100
      when 2
        level_up(mob) if mob.battle_exp > 300
      when 3
        level_up(mob) if mob.battle_exp > 500
      when 4
        level_up(mob) if mob.battle_exp > 1500
      end
    end
  end

  private

  def self.level_up(mob)
    mob.level += 1
    mob.str += mob.str * Tools.gaussian_rand(1,1) / 10
    mob.dex += mob.dex * Tools.gaussian_rand(1,1) / 10
    mob.con += mob.con * Tools.gaussian_rand(1,1) / 10
    mob.int += mob.int * Tools.gaussian_rand(1,1) / 10
    mob.wis += mob.wis * Tools.gaussian_rand(1,1) / 10
    mob.cha += mob.cha * Tools.gaussian_rand(1,1) / 10
    mob.save
    p mob
  end
end
