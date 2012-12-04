class Mosttinytrial < ActiveRecord::Base
  
  has_many :mosttinymobsetups
  accepts_nested_attributes_for :mosttinymobsetups

  belongs_to :def_user, :class_name => 'Mosttinyuser', :foreign_key => 'def_user_id'
  belongs_to :atk_user, :class_name => 'Mosttinyuser', :foreign_key => 'atk_user_id'
  belongs_to :def_strategy, :class_name => 'Mosttinystrategy', :foreign_key => 'def_strategy_id'
  belongs_to :atk_strategy, :class_name => 'Mosttinystrategy', :foreign_key => 'atk_strategy_id'
  belongs_to :map, :class_name => 'Mosttinymap', :foreign_key => 'map_id'
  
  def def_bench_mob_ids
    @def_mob_ids || mosttinymobsetups.collect{|p| p.id}
  end
 
  def def_bench_mob_ids=(id_array)
    @def_mob_ids = id_array.collect{|id| id.to_i};
  end
  
  def def_setup_mob_ids
    @def_mob_ids || mosttinymobsetups.collect{|p| p.id}
  end
 
  def def_setup_mob_ids=(id_array)
    @def_mob_ids = id_array.collect{|id| id.to_i};
  end
  
  def def_setup_mob_ids_and_names_by_user(user_id)
    Mosttinymobsetup.find_all_by_mosttinytrial_id(id, :include => :mosttinymob, :conditions => ["mosttinymobs.mosttinyuser_id = ?", user_id]).map{ |def_setup_mob| [def_setup_mob.mosttinymob.name, def_setup_mob.mosttinymob.id] }
  end

  def def_bench_mob_ids_and_names_by_user(user_id)
    all_mobs = Mosttinymob.find_all_by_mosttinyuser_id(user_id).map{ |def_bench_mob| [def_bench_mob.name, def_bench_mob.id] }
    setup_mobs = Mosttinymobsetup.find_all_by_mosttinytrial_id(id, :include => :mosttinymob, :conditions => ["mosttinymobs.mosttinyuser_id = ?", user_id]).map{ |def_setup_mob| [def_setup_mob.mosttinymob.name, def_setup_mob.mosttinymob.id] }
    all_mobs - setup_mobs 
  end

  def atk_bench_mob_ids
    @atk_mob_ids || mosttinymobsetups.collect{|p| p.id}
  end
 
  def atk_bench_mob_ids=(id_array)
    @atk_mob_ids = id_array.collect{|id| id.to_i};
  end
  
  def atk_setup_mob_ids
    @atk_mob_ids || mosttinymobsetups.collect{|p| p.id}
  end
 
  def atk_setup_mob_ids=(id_array)
    @atk_mob_ids = id_array.collect{|id| id.to_i};
  end
  after_save :assign_setup_mobs

  def assign_setup_mobs
    
    map = Mosttinymap.find(map_id)
 
    2.times do |i|
      
      if i == 0
        mob_ids = @def_mob_ids
        is_guard = true
      elsif i == 1
        mob_ids = @atk_mob_ids
        is_guard = false
      end

      if mob_ids
        new_ids = mob_ids
        old_ids = Mosttinymobsetup.find_all_by_mosttinytrial_id_and_is_guard(id, is_guard).collect{|m| m.mosttinymob_id}
        ids_to_delete = old_ids - (old_ids & new_ids)
        ids_to_add = new_ids - (old_ids & new_ids)
        mosttinytrial_id = id

        ids_to_delete.each do |mobsetup_id|
          Mosttinymobsetup.destroy_all(:mosttinytrial_id => mosttinytrial_id, :mosttinymob_id => mobsetup_id)
        end

        #start_points = Array.new
        ids_to_add.each do |mobsetup_id|
          unless mobsetup_id == 0
            start_point = map.random_unique_inside_point(is_guard)
            Mosttinymobsetup.create(:mosttinytrial_id => mosttinytrial_id, :mosttinymob_id => mobsetup_id, :is_guard => is_guard, :start_x => start_point['x'], :start_y => start_point['y'], :current_x => start_point['x'], :current_y => start_point['y'])
          end
        end
      end
    end
  end
end
