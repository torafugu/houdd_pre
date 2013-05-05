# coding: utf-8

class MediumUpdateConstructionQue
  def self.execute
    MediumHouddUser.all.each do |user|
      unless user.admin_flg
        update_point = (user.hammer_total * user.allot_for_const / 100).round
        p update_point
        user.medium_construction_ques.all.each do |que|
          if update_point > que.nec_point
            update_point -= que.nec_point
            map_cell = MediumMapCell.find(que.medium_map_cell_id)
            map_cell.medium_construction_id = que.medium_construction_id
            map_cell.save
            que.destroy
          else
            que.nec_point -= update_point
            update_point = 0
            que.save
          end
        end
      end
    end
  end
end