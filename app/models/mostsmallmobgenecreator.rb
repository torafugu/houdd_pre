# coding: utf-8

class Mostsmallmobgenecreator
  def self.create(mobspecie_id, mothergene_id, fathergene_id)
    specie = Mostsmallmobspecie.find(mobspecie_id)
    specie_num = 0
    unless Mostsmallmobgene.find_all_by_mostsmallmobspecie_id(mobspecie_id).blank?
      specie_num = Mostsmallmobgene.find_all_by_mostsmallmobspecie_id(mobspecie_id).size + 1
    end 
    mobgene = Mostsmallmobgene.new
    mobgene.name = specie.name + "の遺伝子" + specie_num.to_s
    if specie_num > 2
      mothergene = Mostsmallmobgene.find(mothergene_id) 
      fathergene = Mostsmallmobgene.find(fathergene_id)

      phys_mod_ratio = rand
      phys_mod_from_mother = Tools.gaussian_rand(mothergene.phys_mod, 0.05) * phys_mod_ratio
      phys_mod_from_father = Tools.gaussian_rand(fathergene.phys_mod, 0.05) * (1 - phys_mod_ratio)
      mobgene.phys_mod = (phys_mod_from_mother + phys_mod_from_father).round(4)

      int_mod_ratio = rand
      int_mod_from_mother = Tools.gaussian_rand(mothergene.int_mod, 0.05) * int_mod_ratio
      int_mod_from_father = Tools.gaussian_rand(fathergene.int_mod, 0.05) * (1 - int_mod_ratio)
      mobgene.int_mod = (int_mod_from_mother + int_mod_from_father).round(4)

      prolificacy_mod_ratio = rand
      prolificacy_mod_from_mother = Tools.gaussian_rand(mothergene.prolificacy_mod, 0.05) * prolificacy_mod_ratio
      prolificacy_mod_from_father = Tools.gaussian_rand(fathergene.prolificacy_mod, 0.05) * (1 - prolificacy_mod_ratio)
      mobgene.prolificacy_mod = (prolificacy_mod_from_mother + prolificacy_mod_from_father).round(4)

      longevity_mod_ratio = rand
      longevity_mod_from_mother = Tools.gaussian_rand(mothergene.longevity_mod, 0.05) * longevity_mod_ratio
      longevity_mod_from_father = Tools.gaussian_rand(fathergene.longevity_mod, 0.05) * (1 - longevity_mod_ratio)
      mobgene.longevity_mod = (longevity_mod_from_mother + longevity_mod_from_father).round(4)

      cost_mod_ratio = rand
      cost_mod_from_mother = Tools.gaussian_rand(mothergene.cost_mod, 0.05) * cost_mod_ratio
      cost_mod_from_father = Tools.gaussian_rand(fathergene.cost_mod, 0.05) * (1 - cost_mod_ratio)
      mobgene.cost_mod = (cost_mod_from_mother + cost_mod_from_father).round(4)

      growth_mod_ratio = rand
      growth_mod_from_mother = Tools.gaussian_rand(mothergene.growth_mod, 0.05) * growth_mod_ratio
      growth_mod_from_father = Tools.gaussian_rand(fathergene.growth_mod, 0.05) * (1 - growth_mod_ratio)
      mobgene.growth_mod = (cost_mod_from_mother + growth_mod_from_father).round(4)
    else
      mobgene.phys_mod = 1
      mobgene.int_mod = 1
      mobgene.prolificacy_mod = 1
      mobgene.longevity_mod = 1
      mobgene.cost_mod = 1
      mobgene.growth_mod = 1
    end
    return mobgene
  end
end