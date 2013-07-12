class MediumTrial < ActiveRecord::Base
  belongs_to :medium_map
  belongs_to :def_mission, :class_name => 'MediumMission', :foreign_key => 'def_mission_id'
  belongs_to :atk_mission, :class_name => 'MediumMission', :foreign_key => 'atk_mission_id'
  has_many :medium_trial_turns, :dependent => :delete_all
  has_many :medium_trial_squads, :dependent => :delete_all
  has_many :medium_trial_dungeon_cells, :dependent => :delete_all

  def name
    return read_attribute(:id).to_s + ":" + read_attribute(:occured_at).to_s
  end

  def active_def_squads
    active_def_squads = Array.new
    def_mission.medium_squads.each do |squad|
      active_def_squads << squad if squad.entried? and not squad.annihilated? and not squad.escaped_from_dungeon?
    end
    return active_def_squads
  end

  def active_atk_squads
    active_atk_squads = Array.new
    atk_mission.medium_squads.each do |squad|
      active_atk_squads << squad if squad.entried? and not squad.annihilated? and not squad.escaped_from_dungeon?
    end
    return active_atk_squads
  end

  def active_squads
    return active_def_squads + active_atk_squads
  end

  def def_defeated?
    def_mission.medium_squads.each do |squad|
      p squad.name + ":false" if not squad.annihilated? and not squad.escaped_from_dungeon? and squad.entried?
      #p squad.name + " squad.annihilated? " + squad.annihilated?.to_s
      #p squad.name + " squad.escaped_from_dungeon? " + squad.escaped_from_dungeon?.to_s
      #p squad.name + " squad.entried? " + squad.entried?.to_s
      return false if not squad.annihilated? and not squad.escaped_from_dungeon? and squad.entried?
    end
    return true
  end

  def atk_defeated?
    atk_mission.medium_squads.each do |squad|
      p squad.name + ":false" if not squad.annihilated? and not squad.escaped_from_dungeon? and squad.entried?
      #p squad.name + " squad.annihilated? " + squad.annihilated?.to_s
      #p squad.name + " squad.escaped_from_dungeon? " + squad.escaped_from_dungeon?.to_s
      #p squad.name + " squad.entried? " + squad.entried?.to_s
      return false if not squad.annihilated? and not squad.escaped_from_dungeon? and squad.entried?
    end
    return true
  end

  def dungeon
    return medium_map.all_dungeons.first
  end

  def def_squads_view
    def_squads = Array.new
    def_mission.medium_squads.each do |squad|
      def_squads << medium_trial_squads.find_by_squad_id(squad.id)
    end
    return def_squads
  end

  def atk_squads_view
    atk_squads = Array.new
    atk_mission.medium_squads.each do |squad|
      atk_squads << medium_trial_squads.find_by_squad_id(squad.id)
    end
    return atk_squads
  end

  def convert_to_trial_squad_id(squad_id)
    medium_trial_squads.each do |trial_squad|
      return trial_squad.id if trial_squad.squad_id == squad_id
    end
    return nil
  end

  def convert_to_trial_mob_id(mob_id)
    medium_trial_squads.each do |trial_squad|
      trial_squad.medium_trial_mobs.each do |trial_mob|
        return trial_mob.id if trial_mob.mob_id == mob_id
      end
    end
    return nil
  end
end
