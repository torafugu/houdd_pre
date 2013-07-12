# coding: utf-8

class MediumBattleLog < ActiveRecord::Base
  belongs_to :medium_battle_turn
  belongs_to :trial_mob, :class_name => 'MediumTrialMob', :foreign_key => 'trial_mob_id'
  belongs_to :trial_tgt, :class_name => 'MediumTrialMob', :foreign_key => 'tgt_id'

  def atk?
    return true if trial_mob.medium_trial_squad_id == medium_battle_turn.atk_trial_squad_id
    return false
  end

  def jpn_log
    log = ''
    if read_attribute(:from_vpos) == read_attribute(:to_vpos) and read_attribute(:tgt_id).nil? and read_attribute(:action).nil?
      # no log
    elsif read_attribute(:from_vpos) != read_attribute(:to_vpos) and read_attribute(:tgt_id).nil? and read_attribute(:action).nil?
      log = trial_mob.medium_trial_squad.squad_name + "の" + trial_mob.mob_name + "は" + read_attribute(:from_vpos).to_s + "から" + read_attribute(:to_vpos).to_s + "へ移動。\n"
    elsif not read_attribute(:action).blank? and read_attribute(:damage) == 0 and read_attribute(:trial_mob_id) == read_attribute(:tgt_id)
      log = trial_mob.medium_trial_squad.squad_name + "の" + trial_mob.mob_name + "は" + read_attribute(:action).to_s + "を唱えた。\n"
    elsif not read_attribute(:action).blank? and read_attribute(:damage) == 0 and read_attribute(:trial_mob_id) != read_attribute(:tgt_id)
      log = trial_mob.medium_trial_squad.squad_name + "の" + trial_mob.mob_name + "は" + trial_tgt.mob_name + "へ" + read_attribute(:action).to_s + "を唱えた。\n"
    elsif not read_attribute(:action).blank? and read_attribute(:damage) < 0
      log = trial_mob.medium_trial_squad.squad_name + "の" + trial_mob.mob_name + "は" + trial_tgt.mob_name + "へ" + read_attribute(:action).to_s + "によって" + read_attribute(:damage).abs.to_s + "を回復した。\n"
    elsif not read_attribute(:action).blank? and read_attribute(:damage) > 0
      log = trial_mob.medium_trial_squad.squad_name + "の" + trial_mob.mob_name + "は" + trial_tgt.mob_name + "へ" + read_attribute(:action).to_s + "によって" + read_attribute(:damage).to_s + "のダメージを与えた。\n"
      log += trial_mob.medium_trial_squad.squad_name + "の" + trial_tgt.mob_name + "は死んだ。\n" if read_attribute(:tgt_dead_flg)
    end
    return log
  end
end
