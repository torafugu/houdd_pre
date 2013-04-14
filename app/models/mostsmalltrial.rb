# coding: utf-8

class Mostsmalltrial < ActiveRecord::Base
  belongs_to :mostsmallterritory
  belongs_to :def_mission, :class_name => 'Mostsmallmission', :foreign_key => 'def_mission_id'
  belongs_to :atk_mission, :class_name => 'Mostsmallmission', :foreign_key => 'atk_mission_id'
  has_many :mostsmalltrialturns, :dependent => :delete_all
  has_many :mostsmalltrialsquads, :dependent => :delete_all

  def def_squad?(squad)
    return def_mission.mostsmallsquads.include?(squad)
  end

  def squads
    return def_mission.mostsmallsquads + atk_mission.mostsmallsquads
  end

  def living_def_squads
    living_def_squads = Array.new
    def_mission.mostsmallsquads.each do |squad|
      living_def_squads << squad if not squad.annihilated? and not squad.retreated_from_dungeon?
    end
    return living_def_squads
  end

  def living_atk_squads
    living_atk_squads = Array.new
    atk_mission.mostsmallsquads.each do |squad|
      living_atk_squads << squad if not squad.annihilated? and not squad.retreated_from_dungeon?
    end
    return living_atk_squads
  end

  def living_squads
    return living_def_squads + living_atk_squads
  end

  def def_defeated?
    def_mission.mostsmallsquads.each do |squad|
      return false if not squad.annihilated? and not squad.retreated_from_dungeon?
    end
    return true
  end

  def atk_defeated?
    atk_mission.mostsmallsquads.each do |squad|
      return false if not squad.annihilated? and not squad.retreated_from_dungeon?
    end
    return true
  end

  def def_squads_view
    def_squads = Array.new
    def_mission.mostsmallsquads.each do |squad|
      def_squads << mostsmalltrialsquads.find_by_squad_id(squad.id)
    end
    return def_squads
  end

  def atk_squads_view
    atk_squads = Array.new
    atk_mission.mostsmallsquads.each do |squad|
      atk_squads << mostsmalltrialsquads.find_by_squad_id(squad.id)
    end
    return atk_squads
  end

  def mob_name(mob_id)
    mostsmalltrialsquads.each do |squad|
      mob = squad.mostsmalltrialmobs.find_by_mob_id(mob_id)
      return mob.mob_name unless mob.blank?
    end
  end
end
