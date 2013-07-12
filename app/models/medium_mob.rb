class MediumMob < ActiveRecord::Base
  belongs_to :medium_houdd_user
  belongs_to :medium_specie
  belongs_to :medium_job
  belongs_to :medium_squad
  has_many :medium_skills, :through => :medium_skill_exp_invs
  has_many :medium_skill_exp_invs, :dependent => :delete_all
  has_many :medium_item_equip_invs, :dependent => :delete_all
  has_many :medium_mob_dnas, :dependent => :delete_all
  has_many :medium_battle_effect_invs, :dependent => :delete_all

  HIGHEST_PRIORITY = 1

  attr_accessor :friends
  attr_accessor :enemies
  attr_accessor :vpos
  attr_accessor :ss_dex
  attr_accessor :hate
  attr_accessor :strategy
  attr_accessor :battle_methods

  def name_with_job
    return read_attribute(:name) + "(" + medium_job.name + ")"
  end

  def max_hp
    return con * 2
  end

  def max_sp
    return int
  end

  # def hate
  #   return 0 if @hate.nil?
  #   return @hate
  # end

  def full_phys_def
    base_phys_def = read_attribute(:phys_def)
    item_phys_def = 0
    medium_item_equip_invs.each do |item_equip_inv|
      item_phys_def += item_equip_inv.medium_item.medium_item_info.phys_def unless item_equip_inv.medium_item.blank?
    end
    return base_phys_def + item_phys_def
  end

  def full_skill_def
    base_skill_def = read_attribute(:skill_def)
    item_skill_def = 0
    medium_item_equip_invs.each do |item_equip_inv|
      item_skill_def += item_equip_inv.medium_item.medium_item_info.skill_def unless item_equip_inv.medium_item.blank?
    end
    return base_skill_def + item_skill_def
  end

  def use_sp(sp_cost)
    self_sp = read_attribute(:sp)
    self_sp -= sp_cost
    self_sp = 0 if self_sp < 0
    write_attribute(:sp, self_sp)
  end

  def update_hp(hp_mod)
    self_hp = read_attribute(:hp)
    self_hp -= hp_mod
    self_hp = 0 if self_hp < 0
    self_hp = max_hp if self_hp > max_hp
    write_attribute(:hp, self_hp)
  end

  def natural_death?
    natural_death_period = medium_specie.longevity * Consts::NATURAL_DEATH_SD
    natural_death_period_start = medium_specie.longevity - natural_death_period / 2
    return false if read_attribute(:age) < natural_death_period_start
    one_year_natural_death_rate = Consts::PERCENT_DENOMINATOR / natural_death_period
    return true if rand(Consts::PERCENT_DENOMINATOR) <= one_year_natural_death_rate
    return false
  end

  def died_of_natural_death
    write_attribute(:hp, 0)
    write_attribute(:natural_death_flg, true)
  end

  def revive
    return true if rand(Consts::PERCENT_DENOMINATOR) <= Consts::REVIVE_RATE
    write_attribute(:natural_death_flg, true)
    return false
  end

  def trap_disarmer?
    return true if medium_job.id == Consts::JOBS[:thf]
    return false
  end

  def treasure_searcher?
    return true if medium_job.id == Consts::JOBS[:thf]
    return false
  end

  def dead?
    return true if read_attribute(:hp) == 0
    return false
  end

  def retreated?
    return false if @vpos.nil?
    return true if @vpos < Consts::BATTLE_START_LINE or @vpos > Consts::BATTLE_END_LINE
    return false
  end

  def fighting_will?
    return false if read_attribute(:hp) < max_hp * strategy.retreat_hp_rate
    return true
  end

  def auto_equip
    medium_item_equip_invs.each do |equip_inv|
      next unless equip_inv.medium_item_id.blank?
      available_items = MediumItem.includes(:medium_item_info).where("medium_houdd_user_id = ? and medium_item_infos.medium_body_part_id = ?", medium_houdd_user.id, equip_inv.medium_body_part_id).order("medium_item_infos.weight_level DESC")
      available_items.each do |item|
        available_weight = medium_job.wepon_lvl
        available_weight = medium_job.armor_lvl if item.medium_item_info.armor?
        if MediumItemEquipInv.find_by_medium_item_id(item.id).blank? and item.medium_item_info.weight_level <= available_weight
          equip_inv.medium_item_id = item.id
          equip_inv.save
          break
        end
      end
    end
  end

  def abs_vpos
    if first_atk?
      return @vpos
    else
      return Consts::BATTLE_END_LINE + 1 - @vpos
    end
  end

  def act_turn?
    return true if not dead? and rand(Consts::SS_DEX_MAX) <= @ss_dex
    return false
  end

  def battle_act
    @battle_methods = Marshal.load(Marshal.dump(strategy.battle.methods))
    highest_priority_methods = Array.new
    highest_priority = HIGHEST_PRIORITY

    until @battle_methods.blank? do
      @battle_methods.each do |method|
        highest_priority_methods << method if method.priority = highest_priority
      end

      unless highest_priority_methods.blank?
        battle_method = highest_priority_methods.sample
        @battle_methods.delete(battle_method)
        return battle_method if battle_method_reachable?(battle_method)
      end

      highest_priority += 1
    end
    return nil
  end

  def wepons
    wepons = Array.new
    medium_item_equip_invs.each do |equip_inv|
      if equip_inv.medium_body_part.eqp_wepon_flg
        wepons << equip_inv.medium_item unless equip_inv.medium_item.blank?
      end
    end
    return wepons unless wepons.blank?

    atk_body_parts = Array.new
    medium_specie.medium_body_part_invs.each do |body_part_inv|
      atk_body_parts << body_part_inv unless body_part_inv.medium_atk_info_id.blank?
    end
    return atk_body_parts
  end

  def x_wepons
    x_wepons = Array.new
    wepons.each do |wepon|
      x_wepons << wepon if wepon.medium_atk_info.x_range > 0
    end
    return x_wepons
  end

  def x_range
    x_range = 0
    medium_item_equip_invs.each do |equip_inv|
      next if equip_inv.medium_item_id.blank?
      return equip_inv.medium_item.medium_item_info.medium_atk_info.x_range if equip_inv.medium_item.medium_item_info.x_range?
    end
    return x_range
  end

  def divide_to_first_atk
    @first_atk = true
  end

  def divide_to_second_atk
    @first_atk = false
  end

  def first_atk?
    return @first_atk
  end

  def cast_buff
    strategy.buff_orders.each do |buff_id|
      buff_skill = MediumSkill.find(buff_id)
      buff_exist_flag = false
      medium_battle_effect_invs.each do |effect|
        if buff_skill.medium_status_mod_id == effect.medium_status_mod_id
          buff_exist_flag = true
          break
        end
      end
      next if buff_exist_flag
      add_effect(buff_skill.medium_status_mod_id, read_attribute(:id), buff_skill.duration)
      use_sp(buff_skill.sp_cost)
      #p effect_inv.medium_status_mod.name
      #break
      return buff_skill.medium_status_mod
    end
    return nil
  end

  def add_effect(status_mod_id, caused_mob_id, duration)
    overcasted_inv = nil
    medium_battle_effect_invs.each do |battle_effect_inv|
      if battle_effect_inv.medium_status_mod_id == status_mod_id
        overcasted_inv = battle_effect_inv
        break
      end
    end
    overcasted_inv.destroy unless overcasted_inv.nil?

    effect_inv = MediumBattleEffectInv.new
    effect_inv.medium_mob_id = read_attribute(:id)
    effect_inv.medium_status_mod_id = status_mod_id
    effect_inv.caused_mob_id = caused_mob_id
    effect_inv.rmng_duration = duration
    medium_battle_effect_invs << effect_inv
  end

  def vpos_move
    return move_backward unless fighting_will?
    return move_backward if strategy.back_job? and on_front_line?
    if strategy.vpos - abs_vpos > 0
      return move_forward
    elsif strategy.vpos - abs_vpos < 0
      return move_backward
    end
    return false
  end

  def atk_targets(range, num)
    sorted_enemies_in_range = enemies_in_range(range).sort{|a,b|
      b.hate <=> a.hate
    }
    extract_num = num
    extract_num = sorted_enemies_in_range.length if extract_num > sorted_enemies_in_range.length
    return sorted_enemies_in_range.slice(0..(extract_num - 1)) unless sorted_enemies_in_range.blank?
    return nil
  end

  def x_atk_targets(num)
    atk_to_forward_flag = false
    atk_to_forward_flag = true if rand(100) > Consts::X_ATK_TO_FORWARD_RATE
    atk_line = 0
    if atk_to_forward_flag
      if first_atk?
        atk_line = Consts::BATTLE_END_LINE - 1
      else
        atk_line = Consts::BATTLE_START_LINE + 1
      end
    else
      if first_atk?
        atk_line = Consts::BATTLE_END_LINE
      else
        atk_line = Consts::BATTLE_START_LINE
      end
    end

    enemies_in_line = Array.new
    @enemies.each do |enemy|
      enemies_in_line << enemy if enemy.vpos == atk_line and not enemy.dead?
    end
    return enemies_in_line.sample(num)
  end

  def heal_targets(range, num)
    sorted_damaged_friends_in_range = damaged_friends_in_range(range).sort{|a,b|
      a.hp <=> b.hp
    }
    extract_num = num
    extract_num = sorted_damaged_friends_in_range.length if extract_num > sorted_damaged_friends_in_range.length
    return sorted_damaged_friends_in_range.slice(0..(extract_num - 1)) unless sorted_damaged_friends_in_range.blank?
    return nil
  end

  def shielded?
    medium_battle_effect_invs.each do |battle_effect_inv|
      return true if Consts::SHEILD_STATUS_MOD_IDS.include?(battle_effect_inv.medium_status_mod_id)
    end
    return false
  end

  private

  def on_front_line?
    front_line_vpos = 5
    @enemies.each do |enemy|
      unless enemy.dead?
        distance_from_enemy = (enemy.vpos - @vpos).abs
        front_line_vpos = distance_from_enemy if distance_from_enemy < front_line_vpos
      end
    end
    #p "front_line_vpos:" + front_line_vpos.to_s
    if front_line_vpos > 1
      return false
    else
      return true
    end
  end

  def move_forward
    if first_atk?
      if @vpos < Consts::BATTLE_END_LINE and not on_front_line?
        @vpos += 1
        return true
      else
        return false
      end
    else
      if @vpos > Consts::BATTLE_START_LINE and not on_front_line?
        @vpos -= 1
        return true
      else
        return false
      end
    end
  end

  def move_backward
    if first_atk?
      @vpos -= 1
      return true
    else
      @vpos += 1
      return true
    end
  end

  def battle_method_reachable?(battle_method)
    if battle_method.type == :spt
      return true
    elsif battle_method.type == :phyz
      wepons.each do |wepon|
        return true if enemies_in_range?(wepon.medium_atk_info.d_range)
      end
    elsif battle_method.type == :atk
      atk_skill = MediumSkill.find(battle_method.method_id)
      return true if enemies_in_range?(atk_skill.medium_atk_info.d_range) and atk_skill.sp_cost <= read_attribute(:sp)
    elsif battle_method.type == :heal
      heal_skill = MediumSkill.find(battle_method.method_id)
      return true if damaged_friends_in_range?(heal_skill.medium_atk_info.d_range) and heal_skill.sp_cost <= read_attribute(:sp)
    end
    return false
  end

  def enemies_in_range(range)
    enemies_in_range = Array.new
    @enemies.each do |enemy|
      enemies_in_range << enemy if range >= (enemy.vpos - @vpos).abs and not enemy.dead? and not enemy.retreated?
    end
    return enemies_in_range
  end

  def enemies_in_range?(range)
    if enemies_in_range(range).blank?
      return false
    else
      return true
    end
  end

  def damaged_friends_in_range(range)
    damaged_friends_in_range = Array.new
    @friends.each do |friend|
      damaged_friends_in_range << friend if (friend.vpos - @vpos).abs <= range and not friend.dead? and friend.hp < friend.max_hp and not friend.retreated?
    end
    return damaged_friends_in_range
  end

  def damaged_friends_in_range?(range)
    if damaged_friends_in_range(range).blank?
      return false
    else
      return true
    end
  end
end
