class MediumMobCreator
  MALE = 'M'
  FEMALE = 'F'
  def self.execute(specie_id, num)
    p MediumGene.find_all_by_medium_specie_id(2).shuffle[0..1]
    specie = MediumSpecie.find(specie_id)
    num.times do |i|
      gene_pair = MediumGene.find_all_by_medium_specie_id(specie.id).shuffle[0..1]
      gene_a =  gene_pair[0]
      gene_b =  gene_pair[1]
      if gene_pair[0].dominance_flg and not gene_pair[1].dominance_flg
        gene_b =  gene_pair[0]
      elsif not gene_pair[0].dominance_flg and gene_pair[1].dominance_flg
        gene_a =  gene_pair[1]
      end

      mob = MediumMob.new
      mob.medium_specie_id = specie.id
      mob.level = 1
      mob.exp = 0
      mob.name = specie.name + ((0..9).to_a).shuffle[0..9].join
      if rand(2) > 0
        mob.gender_sym = MALE
      else
        mob.gender_sym = FEMALE
      end
      mob.age = specie.longevity * mix_mod(gene_a.longevity_mod, gene_b.longevity_mod) * Consts::MOB_ADULT_RATE
      mob.str = specie.str * mix_mod(gene_a.str_mod, gene_b.str_mod)
      mob.dex = specie.dex * mix_mod(gene_a.dex_mod, gene_b.dex_mod)
      mob.con = specie.con * mix_mod(gene_a.con_mod, gene_b.con_mod)
      mob.int = specie.int * mix_mod(gene_a.int_mod, gene_b.int_mod)
      mob.wis = specie.wis * mix_mod(gene_a.wis_mod, gene_b.wis_mod)
      mob.cha = specie.cha * mix_mod(gene_a.cha_mod, gene_b.cha_mod)
      mob.hp = mob.con
      mob.sp = mob.int
      mob.phys_def = specie.phys_def * mix_mod(gene_a.phys_def_mod, gene_b.phys_def_mod)
      mob.skill_def = specie.skill_def * mix_mod(gene_a.skill_def_mod, gene_b.skill_def_mod)
      mob.ele_fw_mod = specie.ele_fw_mod * mix_mod(gene_a.ele_fw_mod, gene_b.ele_fw_mod)
      mob.ele_ld_mod = specie.ele_ld_mod * mix_mod(gene_a.ele_ld_mod, gene_b.ele_ld_mod)
      mob.save

      # create 2 DNAs
      mob_dna1 = MediumMobDna.new
      mob_dna1.medium_mob_id = mob.id
      mob_dna1.medium_gene_id = gene_pair[0].id
      mob_dna1.save

      mob_dna2 = MediumMobDna.new
      mob_dna2.medium_mob_id = mob.id
      mob_dna2.medium_gene_id = gene_pair[1].id
      mob_dna2.save

      # set job
      job_roll = rand(100) + 1
      prev_ratio = 1
      specie.medium_specie_job_invs.each do |job_inv|
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

      mob.save
    end
  end

  def self.mix_mod(gene_a_mod, gene_b_mod)
    if gene_a_mod == gene_b_mod
      return (1 + gene_a_mod + Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4))
    else
      return (1 + (gene_a_mod + gene_b_mod) / 2 + Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4))
    end
  end
end