# coding: utf-8

class Moresmallturncreator
  def self.create_all_by_id(trial_id)
    trial = Moresmalltrial.find(trial_id)
    is_intruder_retreated = false
    is_guard_retreated = false
    prepare(trial)
    until is_guard_retreated or is_intruder_retreated
      create(trial)
      is_intruder_retreated = true if Moresmallstrategyhandler.intruder_retreated?(trial)
      is_guard_retreated = true if Moresmallstrategyhandler.guard_retreated?(trial)
    end

    turn = Moresmalltrialturn.new
    turn.moresmalltrial_id = trial_id
    turn.log = "攻撃側撤退。\n" if is_intruder_retreated
    turn.log = "防御側撤退。\n" if is_guard_retreated
    turn.save
    trial.moresmalltrialturns << turn
    trial.moresmalltrialstatus_id = 3
    trial.save
  end

  def self.create_by_id(trial_id)
    create(Moresmalltrial.find(trial_id))
  end

  def self.create(trial)
    turn = Moresmalltrialturn.new(:moresmalltrial_id => trial.id)
    squad_trails = Hash.new
    squad_from_points = Hash.new
    battle_que = Array.new
    mob_start_hps = Hash.new
    mob_start_mps = Hash.new

    atk_squads = Array.new
    trial.atk_mobunit.moresmallmobsquads.each do |squad|
      atk_squads << squad unless squad.annihilated?
    end

    def_squads = Array.new
    trial.def_mobunit.moresmallmobsquads.each do |squad|
      def_squads << squad unless squad.annihilated?
    end

    all_squads = atk_squads + def_squads
    all_squads.each do |squad|
      squad_trails[squad.id] = ''
      squad_from_points[squad.id] = Marshal.load(Marshal.dump(squad.cpoint))

      squad.moresmallmobs.each do |mob|
        mob_start_hps[mob.id] = mob.hp
        mob_start_mps[mob.id] = mob.mp
      end
    end

    is_battle_happen = false
    while not is_battle_happen
      atk_squads.each do |atk_squad|
        # Calculate dist from intruder mob to guard mob.
        def_squads.each do |def_squad|
          dist = calc_dist(atk_squad.cpoint, def_squad.cpoint)
          def_squad.dist = dist
        end

        sorted_def_squads = def_squads.sort{|a,b|
          a.dist <=> b.dist
        }

        tgt_def_squad = sorted_def_squads[0]
        atk_squad.dpoint = tgt_def_squad.cpoint

        trail = next_trail(trial.moresmallmap, atk_squads, atk_squad)
        squad_trails[atk_squad.id] += trail
        atk_squad.move(trail)

        p atk_squad.name
        p atk_squad.cpoint
        battle_que << {"src"=>atk_squad, "tgt"=>tgt_def_squad} if atk_squad.arrived?
      end

      def_squads.each do |def_squad|
        # Calculate dist from intruder mob to guard mob.
        atk_squads.each do |atk_squad|
          dist = calc_dist(atk_squad.cpoint, def_squad.cpoint)
          atk_squad.dist = dist
        end

        sorted_atk_squads = atk_squads.sort{|a,b|
          a.dist <=> b.dist
        }

        p sorted_atk_squads.length
        tgt_atk_squad = sorted_atk_squads[0]
        def_squad.dpoint = tgt_atk_squad.cpoint

        trail = next_trail(trial.moresmallmap, def_squads, def_squad)
        squad_trails[def_squad.id] += trail
        def_squad.move(trail)

        p def_squad.name
        p def_squad.cpoint
        battle_que << {"src"=>def_squad, "tgt"=>tgt_atk_squad} if def_squad.arrived?
      end
      is_battle_happen = true if not battle_que.empty?
    end

    battle_que.each do |battle|
      unless battle["src"].annihilated? or battle["tgt"].annihilated?
        Moresmallbattlecreator.create(turn, battle["src"], battle["tgt"])
      end
    end

    all_squads.each do |squad|
      squad_trail = Moresmallturnsquadtrail.new
      squad_trail.squad_id = squad.id
      squad_trail.from_x = squad_from_points[squad.id]["x"]
      squad_trail.from_y = squad_from_points[squad.id]["y"]
      squad_trail.to_x = squad.cpoint['x']
      squad_trail.to_y = squad.cpoint['y']
      squad_trail.trail = squad_trails[squad.id]
      squad_trail.is_annihilated = squad.annihilated?
      squad_trail.save
      turn.moresmallturnsquadtrails << squad_trail

      squad.moresmallmobs.each do |mob|
        mob_status = Moresmallturnmobstatus.new
        mob_status.moresmalltrialturn_id = turn.id
        mob_status.mob_id = mob.id
        mob_status.start_hp = mob_start_hps[mob.id]
        mob_status.end_hp = mob.hp
        mob_status.start_mp = mob_start_mps[mob.id]
        mob_status.end_mp = mob.mp
        mob_status.status = ""
        mob.moresmallmobeffects.each do |effect|
          mob_status.status += effect.moresmallmagicinfo.name + ","
        end
        mob_status.status = mob_status.status.chop unless mob_status.status.blank?
        mob_status.save
        turn.moresmallturnmobstatuses << mob_status
      end
    end

    turn.save
    trial.moresmalltrialturns << turn
    trial.save
  end

  def self.prepare_by_id(trial_id)
    prepare(Moresmalltrial.find(trial_id))
  end

  def self.prepare(trial)
    # Create first turn.
    first_turn = Moresmalltrialturn.new(:moresmalltrial_id => trial.id)
    first_turn.save

    # Retrieve mobunit, mobsquads and mobs.
    # Deploy mobs.
    # Create squad and mob name persistence.
    squads = trial.def_mobunit.moresmallmobsquads + trial.atk_mobunit.moresmallmobsquads
    squads.each do |squad|
      squadsetup_point = trial.moresmallmap.random_unique_inside_point(squad.moresmallmobunit.guard?)
      squad_trail = Moresmallturnsquadtrail.new
      squad_trail.moresmalltrialturn_id = first_turn.id
      squad_trail.squad_id = squad.id
      squad_trail.from_x = squadsetup_point['x']
      squad_trail.from_y = squadsetup_point['y']
      squad_trail.to_x = squadsetup_point['x']
      squad_trail.to_y = squadsetup_point['y']
      squad_trail.trail = ""
      squad_trail.is_annihilated = squad.annihilated?
      squad.cpoint = {"x"=> squadsetup_point['x'], "y"=> squadsetup_point['y']}
      first_turn.moresmallturnsquadtrails << squad_trail

      squad_pers = Moresmalltrialsquadpers.new
      squad_pers.moresmalltrial_id = trial.id
      squad_pers.mobunit_id = squad.moresmallmobunit.id
      squad_pers.squad_id = squad.id
      squad_pers.squad_name = squad.name
      squad_pers.save

      squad.moresmallmobs.each do |mob|
        mob_status = Moresmallturnmobstatus.new
        mob_status.moresmalltrialturn_id = first_turn.id
        mob_status.mob_id = mob.id
        mob_status.start_hp = mob.hp
        mob_status.end_hp = mob.hp
        mob_status.start_mp = mob.mp
        mob_status.end_mp = mob.mp
        first_turn.moresmallturnmobstatuses << mob_status

        mob_pers = Moresmalltrialmobpers.new
        mob_pers.moresmalltrial_id = trial.id
        mob_pers.moresmalltrialsquadpers_id = squad_pers.id
        mob_pers.mob_id = mob.id
        mob_pers.mob_info_name = mob.info_name
        mob_pers.mob_name = mob.name
        mob_pers.max_hp = mob.max_hp
        mob_pers.max_mp = mob.max_mp
        mob_pers.str = mob.str
        mob_pers.dex = mob.dex
        mob_pers.int = mob.int
        mob_pers.wis = mob.wis
        squad_pers.moresmalltrialmobperss << mob_pers
      end
      trial.moresmalltrialsquadperss << squad_pers
    end

    first_turn.save
    trial.moresmalltrialturns << first_turn
    trial.save
  end

  private

  def self.calc_dist(point1, point2)
    return Math.sqrt((point1['x'] - point2['x']) ** 2 + (point1['y'] - point2['y']) ** 2)
  end

  def self.next_trail(map, friends, myself)
    poss_direcs = myself.poss_direcs

    # 1. Delete directions where the friend squad exists.
    friends.each do |friend|
      case friend.cpoint
      when myself.east_of_cpoint
        poss_direcs.delete_if {|x| x == 'E'}
      when myself.west_of_cpoint
        poss_direcs.delete_if {|x| x == 'W'}
      when myself.south_of_cpoint
        poss_direcs.delete_if {|x| x == 'S'}
      when myself.north_of_cpoint
        poss_direcs.delete_if {|x| x == 'N'}
      end
    end

    # 2. Delete directions where is located at outside of the map.
    poss_direcs.delete_if {|x| x == 'E'} unless map.inside?(myself.east_of_cpoint)
    poss_direcs.delete_if {|x| x == 'W'} unless map.inside?(myself.west_of_cpoint)
    poss_direcs.delete_if {|x| x == 'S'} unless map.inside?(myself.south_of_cpoint)
    poss_direcs.delete_if {|x| x == 'N'} unless map.inside?(myself.north_of_cpoint)

    return poss_direcs[rand(poss_direcs.length)] || ''
  end
end
