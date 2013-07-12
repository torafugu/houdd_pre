class MediumBattleTurn < ActiveRecord::Base
  belongs_to :medium_trial_turn
  has_many :medium_battle_logs, :dependent => :delete_all
  belongs_to :atk_trial_squad, :class_name => 'MediumTrialSquad', :foreign_key => 'atk_trial_squad_id'
  belongs_to :def_trial_squad, :class_name => 'MediumTrialSquad', :foreign_key => 'def_trial_squad_id'

  def battle_logs_for_tactical_map
    entried_squads = Hash.new
    battle_logs_for_tactical_map = Array.new
    medium_battle_logs.each do |battle_log|
      if entried_squads[battle_log.trial_mob_id].blank? or battle_log.from_vpos != battle_log.to_vpos or battle_log.tgt_dead_flg
        battle_logs_for_tactical_map << battle_log
        entried_squads[battle_log.trial_mob_id] = battle_log.trial_mob
      end
    end
    return battle_logs_for_tactical_map
  end
end
