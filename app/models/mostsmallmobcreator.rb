# coding: utf-8

class Mostsmallmobcreator
  def self.create(mobgene_id)
    gene = Mostsmallmobgene.find(mobgene_id)
    specie = gene.mostsmallmobspecie
    specie_num = Mostsmallmob.find(:all, :include => :mostsmallmobgene, :conditions => ["mostsmallmobgenes.mostsmallmobspecie_id = ?", specie.id]).size
    mob = Mostsmallmob.new
    mob.level = 1
    mob.job_level = 1
    mob.name = specie.name + (specie_num + 1).to_s
    gender_roll = rand(2)
    if gender_roll == 0
      mob.gender = false
    else
      mob.gender = true
    end
    longevity_mod = Tools.gaussian_rand(gene.longevity_mod, 0.1)
    mob.age = (specie.longevity * longevity_mod) * 0.1875
    mob.max_hp = Tools.gaussian_rand(specie.max_hp, specie.max_hp * 0.1)
    mob.max_sp = Tools.gaussian_rand(specie.max_sp, specie.max_sp * 0.1)
    mob.hp = mob.max_hp
    mob.sp = mob.max_sp
    mob.str = Tools.gaussian_rand(specie.str, specie.str * 0.1)
    mob.dex = Tools.gaussian_rand(specie.dex, specie.dex * 0.1)
    mob.con = Tools.gaussian_rand(specie.con, specie.con * 0.1)
    mob.int = Tools.gaussian_rand(specie.int, specie.int * 0.1)
    mob.wis = Tools.gaussian_rand(specie.wis, specie.wis * 0.1)
    mob.cha = Tools.gaussian_rand(specie.cha, specie.cha * 0.1)
    mob.battle_exp = 0
    mob.job_exp = 0
    return mob
  end
end