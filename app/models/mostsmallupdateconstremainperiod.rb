class Mostsmallupdateconstremainperiod
  def self.execute
    Mostsmallterritory.all.each do |territory|
      territory.mostsmallconstructions.each do |const|
        const.remaining_period -= 1 if const.remaining_period > 0
        const.save
      end
    end
  end
end
