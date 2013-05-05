class MediumGeneCreator
  def self.execute(specie_id, num)
    specie = MediumSpecie.find(specie_id)
    num.times do |i|
      gene = MediumGene.new
      gene.name = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..14].join
      gene.medium_specie_id = specie.id
      if rand(2) > 0
        gene.dominance_flg = true
      else
        gene.dominance_flg = false
      end
      gene.prolificacy_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.longevity_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.growth_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.cost_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.str_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.dex_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.con_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.int_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.wis_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.cha_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.phys_def_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.skill_def_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.ele_fw_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.ele_ld_mod = Tools.gaussian_rand(0, Consts::GENE_VARIANCE).round(4)
      gene.save
    end
  end
end