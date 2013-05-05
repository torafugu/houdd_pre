# coding: utf-8

class MediumUpdateResearch
  def self.execute
    MediumHouddUser.all.each do |user|
      unless user.admin_flg
        update_point = (user.hammer_total * user.allot_for_research / 100).round
        p update_point
        user.medium_research_allotments.all.each do |allot|
          allot.research_point += (update_point * allot.allotment / 100).round
          allot.save
        end
      end
    end
  end
end