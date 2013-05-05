# coding: utf-8

class MediumUpdateItemManufactureQue
  def self.execute
    MediumHouddUser.all.each do |user|
      unless user.admin_flg
        update_point = (user.hammer_total * user.allot_for_item / 100).round
        p update_point
        user.medium_item_manufacture_ques.all.each do |que|
          if update_point > que.nec_point
            p "完成"
            update_point -= que.nec_point
            item_info = MediumItemInfo.find(que.medium_item_info_id)
            item = MediumItem.new
            item.medium_houdd_user_id = user.id
            item.medium_item_info_id = item_info.id
            item.dp = item_info.max_dp
            item.quality = Tools.gaussian_rand.truncate
            item.save
            que.destroy
          else
            p "未完成"
            que.nec_point -= update_point
            update_point = 0
            que.save
          end
        end
      end
    end
  end
end