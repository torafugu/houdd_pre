class Moretinymap < ActiveRecord::Base

  has_many :moretinymobs

  def intruderStartXY

    startX = nil
    startY = 0

    read_attribute(:map).split("|").each do |dungeonText|

      startX = dungeonText.index("S")
      if startX then
        return startX.to_s + ',' + startY.to_s
      end
      startY += 1
    end

    return nil
  end

  def xsize
    return read_attribute(:map).split("|")[0].length
  end

  def ysize
    return read_attribute(:map).split("|").length
  end
end
