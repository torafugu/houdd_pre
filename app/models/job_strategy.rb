class JobStrategy
  attr_accessor :job_id
  attr_accessor :back_job_flg
  attr_accessor :retreat_hp_rate
  attr_accessor :vpos
  attr_accessor :buff_orders
  attr_accessor :battle_strategies

  class JobBattleStrategy
    attr_accessor :job_id
    attr_accessor :id
    attr_accessor :battle_methods

    BattleMethod = Struct.new(:type, :method_id, :priority)

    def initialize(job_id, id)
      @job_id = job_id
      @id = id
      @battle_methods = Array.new
    end

    def wepon(wepon_sym, priority)
      @battle_methods << BattleMethod.new(:phyz, wepon_sym, priority)
    end

    def skill(skill_sym, priority)
      skill = MediumSkill.find(Consts::JOB_SKILLS[@job_id][skill_sym])
      type = :spt
      type = :atk if skill.skill_category_sym == 'DD' or skill.skill_category_sym == 'DOT'
      type = :heal if skill.skill_category_sym == 'DH' or skill.skill_category_sym == 'HOT'
      @battle_methods << BattleMethod.new(type, skill.id, priority)
    end

    def methods
      return @battle_methods
    end

    def methods_by_priority(priority)
      methods = Array.new
      @battle_methods.each do |method|
        methods << method if method.priority = priority
      end
      return methods
    end
  end

  def initialize(id)
    @job_id = id
    @buff_orders = Array.new
    @battle_strategies = Array.new
  end
  
  def buff(skill_sym)
    buff_skill_id = Consts::JOB_SKILLS[@job_id][skill_sym]
    @buff_orders << buff_skill_id unless @buff_orders.index(buff_skill_id)
  end

  def battle
    @battle_strategies << JobBattleStrategy.new(@job_id, 0) if @battle_strategies.blank?
    return @battle_strategies.first 
  end

  def back_job?
    return @back_job_flg
  end
end