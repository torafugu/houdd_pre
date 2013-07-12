class MediumMobCreator
  MALE = 'M'
  FEMALE = 'F'
  def self.random_execute(specie_id, num, user_id)
    specie = MediumSpecie.find(specie_id)
    num.times do |i|
      gene_pair = MediumGene.find_all_by_medium_specie_id(specie.id).shuffle[0..1]
      execute(nil, nil, gene_pair, user_id)
    end
  end

  def self.mating_execute(father_id, mother_id, user_id)
    genes = Array.new
    genes << MediumMob.find(father_id).medium_mob_dnas.shuffle.first.medium_gene
    genes << MediumMob.find(mother_id).medium_mob_dnas.shuffle.first.medium_gene
    execute(father_id, mother_id, genes, user_id)
  end

  def self.execute(father_id, mother_id, genes, user_id)
    gene_a =  genes[0]
    gene_b =  genes[1]
    if genes[0].dominance_flg and not genes[1].dominance_flg
      gene_b =  genes[0]
    elsif not genes[0].dominance_flg and genes[1].dominance_flg
      gene_a =  genes[1]
    end

    mob = MediumMob.new
    mob.medium_specie_id = gene_a.medium_specie_id
    mob.father_id = father_id
    mob.mother_id = mother_id
    mob.medium_houdd_user_id = user_id unless user_id.blank?
    mob.level = 1
    mob.exp = 0
    mob.name = mob.medium_specie.name + ((0..9).to_a).shuffle[0..9].join
    if rand(2) > 0
      mob.gender_sym = MALE
    else
      mob.gender_sym = FEMALE
    end
    mob.age = mob.medium_specie.longevity * mix_mod(gene_a.longevity_mod, gene_b.longevity_mod) * Consts::MOB_ADULT_RATE
    mob.str = mob.medium_specie.str * mix_mod(gene_a.str_mod, gene_b.str_mod)
    mob.dex = mob.medium_specie.dex * mix_mod(gene_a.dex_mod, gene_b.dex_mod)
    mob.con = mob.medium_specie.con * mix_mod(gene_a.con_mod, gene_b.con_mod)
    mob.int = mob.medium_specie.int * mix_mod(gene_a.int_mod, gene_b.int_mod)
    mob.wis = mob.medium_specie.wis * mix_mod(gene_a.wis_mod, gene_b.wis_mod)
    mob.cha = mob.medium_specie.cha * mix_mod(gene_a.cha_mod, gene_b.cha_mod)
    mob.hp = mob.con
    mob.sp = mob.int
    mob.phys_def = mob.medium_specie.phys_def * mix_mod(gene_a.phys_def_mod, gene_b.phys_def_mod)
    mob.skill_def = mob.medium_specie.skill_def * mix_mod(gene_a.skill_def_mod, gene_b.skill_def_mod)
    mob.ele_fw_mod = mob.medium_specie.ele_fw_mod * mix_mod(gene_a.ele_fw_mod, gene_b.ele_fw_mod)
    mob.ele_ld_mod = mob.medium_specie.ele_ld_mod * mix_mod(gene_a.ele_ld_mod, gene_b.ele_ld_mod)
    mob.save

    # create 2 DNAs
    mob_dna1 = MediumMobDna.new
    mob_dna1.medium_mob_id = mob.id
    mob_dna1.medium_gene_id = genes[0].id
    mob_dna1.save

    mob_dna2 = MediumMobDna.new
    mob_dna2.medium_mob_id = mob.id
    mob_dna2.medium_gene_id = genes[1].id
    mob_dna2.save

    # set job
    job_roll = rand(100) + 1
    prev_ratio = 1
    mob.medium_specie.medium_specie_job_invs.each do |job_inv|
      if job_roll.between?(prev_ratio, prev_ratio + job_inv.ratio - 1)
        mob.medium_job_id = job_inv.medium_job_id
        break
      end
      prev_ratio += job_inv.ratio
    end

    # set skill exp
    mob.medium_job.medium_skills.each do |skill|
      skill_exp = MediumSkillExpInv.new
      skill_exp.medium_mob_id = mob.id
      skill_exp.medium_skill_id = skill.id
      skill_exp.level = 0
      skill_exp.exp = 0
      skill_exp.save
    end

    # set item equip
    mob.medium_specie.medium_body_part_invs.each do |body_part_inv|
      equip_inv = MediumItemEquipInv.new
      equip_inv.medium_mob_id = mob.id
      equip_inv.medium_body_part_id = body_part_inv.medium_body_part_id
      equip_inv.save
    end

    mob.save
  end

  def self.mix_mod(gene_a_mod, gene_b_mod)
    if gene_a_mod == gene_b_mod
      return (1 + gene_a_mod + Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4))
    else
      return (1 + (gene_a_mod + gene_b_mod) / 2 + Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4))
    end
  end
end