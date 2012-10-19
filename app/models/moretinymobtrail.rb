class Moretinymobtrail < ActiveRecord::Base

  belongs_to :moretinymob
  has_many :moretinymobbattles

  def trailpoints

    destX = 0
    destY = 0
    prevDirection = ""
    pointArray = Array.new
    pointHash = Hash.new

    read_attribute(:trail).split("").each do |direction|

      if prevDirection.empty? then prevDirection = direction end

      if direction == prevDirection then

        if direction == "N" then
          destY -= 1
        elsif direction == "S" then
          destY += 1
        elsif direction == "E" then
          destX += 1
        elsif direction == "W" then
          destX -= 1
        end

      else

        pointHash['x'] = destX.to_s
        pointHash['y'] = destY.to_s
        pointArray.push pointHash
        pointHash = Hash.new

        prevDirection = direction
        destX = 0
        destY = 0
        if direction == "N" then
          destY -= 1
        elsif direction == "S" then
          destY += 1
        elsif direction == "E" then
          destX += 1
        elsif direction == "W" then
          destX -= 1
        end
      end
    end

    return pointArray
  end
end
