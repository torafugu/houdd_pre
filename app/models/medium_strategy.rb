class MediumStrategy
  attr_accessor :jobs
  attr_accessor :squads

  def initialize
    @jobs = Array.new(Consts::JOBS.size + 1)
    @squads = Hash.new
  end

  def eval_script(script)
    instance_eval(script.gsub("\r\n", ";"))
  end

  def job(symbol)
    job_id = Consts::JOBS[symbol]
    @jobs[job_id] = JobStrategy.new(job_id) if @jobs[job_id].nil?
    return @jobs[job_id]
  end

  def squad(id)
    @squads[id] = SquadStrategy.new(id) if @squads[id].nil?
    return @squads[id]
  end
end