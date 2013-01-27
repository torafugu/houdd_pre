class Moresmallmobsquad < ActiveRecord::Base
  belongs_to :moresmalluser
  belongs_to :moresmallmobunit
  has_many :moresmallmobs

  def cpoint
    return @cpoint
  end

  def cpoint=(point)
    @cpoint = point
  end

  def east_of_cpoint
    return {"x"=>@cpoint['x'] + 1, "y"=>@cpoint['y']}
  end

  def west_of_cpoint
    return {"x"=>@cpoint['x'] - 1, "y"=>@cpoint['y']}
  end

  def south_of_cpoint
    return {"x"=>@cpoint['x'], "y"=>@cpoint['y'] + 1}
  end

  def north_of_cpoint
    return {"x"=>@cpoint['x'], "y"=>@cpoint['y'] - 1}
  end

  def dist
    return @dist
  end

  def dist=(interval)
    @dist = interval
  end

  def arrived?
    return true if cpoint == @dpoint
    return false
  end

  def dpoint=(point)
    @dpoint = point
    @diff_to_tgt = {"x"=>@dpoint['x'] - @cpoint['x'], "y"=> @dpoint['y'] - @cpoint['y']}
  end

  def move(direc)
    @cpoint['x'] += 1 if direc == 'E'
    @cpoint['x'] -= 1 if direc == 'W'
    @cpoint['y'] += 1 if direc == 'S'
    @cpoint['y'] -= 1 if direc == 'N'
  end

  def poss_direcs
    direcs = Array.new
    
    if @diff_to_tgt['x'] > 0
      direcs << 'E'
    elsif @diff_to_tgt['x'] < 0
      direcs << 'W'
    end

    if @diff_to_tgt['y'] > 0
      direcs << 'S'
    elsif @diff_to_tgt['y'] < 0
      direcs << 'N'
    end

    return direcs
  end

  def annihilated?
    moresmallmobs.each do |mob|
      return false unless mob.dead?
    end
    return true
  end

  def mob_exists_at?(vpos)
    moresmallmobs.each do |mob|
      return true if mob.vpos == vpos
    end
    return false
  end

  def mob_names
    return moresmallmobs.collect{|m| m.name}.join(', ')
  end

  def mob_ids
    return @mob_ids || moresmallmobs.collect{|m| m.id}
  end

  def mob_ids=(id_array)
    return @mob_ids = id_array.collect{|id| id.to_i}
  end

  after_save :assign_mobs

  private

  def assign_mobs
    if @mob_ids
      new_ids = @mob_ids
      old_ids = moresmallmobs.collect{|m| m.id}
      ids_to_delete = old_ids - (old_ids & new_ids)
      ids_to_add = new_ids - (old_ids & new_ids)
      moresmallmobsquad_id = id
 
      ids_to_delete.each do |squad_id|
        Moresmallmob.find(squad_id).update_attribute(:moresmallmobsquad_id, nil)
      end
 
      ids_to_add.each do |squad_id|
        unless squad_id == 0
          Moresmallmob.find(squad_id).update_attribute(:moresmallmobsquad_id ,moresmallmobsquad_id)
        end
      end
    end
  end
end
