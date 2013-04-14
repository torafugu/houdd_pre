# coding: utf-8

class Mostsmallbattlelog < ActiveRecord::Base
  belongs_to :mostsmallbattleturn
  belongs_to :effect, :class_name => 'Mostsmalleffect', :foreign_key => 'effect_id'

  def defender?
    defender_squad_id = mostsmallbattleturn.mostsmallbattleset.def_squad_id
    defender_mob_ids = mostsmallbattleturn.mostsmallbattleset.mostsmalltrialturn.mostsmalltrial.mostsmalltrialsquads.find_by_squad_id(defender_squad_id).mostsmalltrialmobs.collect{|s| s.mob_id}
    return true if defender_mob_ids.include?(read_attribute(:atk_mob_id))
    return false
  end

  def jpn_log
    atk_mob_name = mostsmallbattleturn.mostsmallbattleset.mostsmalltrialturn.mostsmalltrial.mob_name(read_attribute(:atk_mob_id))
    if read_attribute(:atk_mob_id) == read_attribute(:def_mob_id) and not read_attribute(:effect_id).nil?
      return atk_mob_name + "は" + effect.name + "を唱えた。\n"
    elsif not read_attribute(:def_mob_id).nil? and not read_attribute(:damage_cause).nil?
      if read_attribute(:damage) > 0
        def_mob_name = mostsmallbattleturn.mostsmallbattleset.mostsmalltrialturn.mostsmalltrial.mob_name(read_attribute(:def_mob_id))
        log =  atk_mob_name + "は" + def_mob_name + "へ" + read_attribute(:damage_cause) + "による攻撃。"
        log += read_attribute(:damage).to_s + "のダメージを与えた。\n"
        return log
      elsif read_attribute(:damage) < 0
        def_mob_name = mostsmallbattleturn.mostsmallbattleset.mostsmalltrialturn.mostsmalltrial.mob_name(read_attribute(:def_mob_id))
        log =  atk_mob_name + "は" + def_mob_name + "へ" + read_attribute(:damage_cause) + "によるヒール。"
        log += read_attribute(:damage).abs.to_s + "を回復した。\n"
        return log
      end
    end
  end
end
