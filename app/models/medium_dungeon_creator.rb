class MediumDungeonCreator
  DUNGEON_X_SIZE = Consts::NORMAL_DUNGEON_X_SIZE
  DUNGEON_Y_SIZE = Consts::NORMAL_DUNGEON_Y_SIZE
  @big_room_size = 7
  @small_room_size = 5

  def self.random_cell(dungeon_id)
    MediumDungeonCell.destroy_all(["medium_dungeon_id = ?", dungeon_id])
    # First room
    dungeon_cells = Array.new(DUNGEON_Y_SIZE).map!{ Array.new(DUNGEON_X_SIZE, '0') }
    first_area = Area.new(0, 0, DUNGEON_X_SIZE / 2)
    first_area.set_room(random_room)
    first_area.set_exit_path(true)
    first_area.update_cels(dungeon_cells)
    second_area = Area.new(DUNGEON_X_SIZE / 2, 0, DUNGEON_X_SIZE / 2)
    second_area.set_room(random_room)
    second_area.set_exit_path(false)
    second_area.update_cels(dungeon_cells)
    create_room_path(first_area, second_area, dungeon_cells)
    third_area = Area.new(0, DUNGEON_Y_SIZE / 2, DUNGEON_X_SIZE / 2)
    third_area.set_room(random_room)
    third_area.set_exit_path(false)
    third_area.update_cels(dungeon_cells)
    create_room_path(first_area, third_area, dungeon_cells)
    forth_area = Area.new(DUNGEON_X_SIZE / 2, DUNGEON_Y_SIZE / 2, DUNGEON_X_SIZE / 2)
    forth_area.set_room(random_room)
    forth_area.set_exit_path(true)
    forth_area.update_cels(dungeon_cells)
    create_room_path(third_area, forth_area, dungeon_cells)
    create_room_path(second_area, forth_area, dungeon_cells)

    #p dungeon_cells

    DUNGEON_Y_SIZE.times do |y|
      DUNGEON_X_SIZE.times do |x|
        dungeon_cell = MediumDungeonCell.new
        dungeon_cell.medium_dungeon_id = dungeon_id
        dungeon_cell.x = x
        dungeon_cell.y = y
        dungeon_cell.symbol = dungeon_cells[x][y]
        #p dungeon_cells[x][y]
        dungeon_cell.save
      end
    end
  end

  def self.comp_random_cell(dungeon_id)
    MediumDungeonCell.destroy_all(["medium_dungeon_id = ?", dungeon_id])
    DUNGEON_Y_SIZE.times do |y|
      DUNGEON_X_SIZE.times do |x|
        dungeon_cell = MediumDungeonCell.new
        dungeon_cell.medium_dungeon_id = dungeon_id
        dungeon_cell.x = x
        dungeon_cell.y = y
        material = Consts::DUNGEON_BLANK_SYMBOL
        material_roll = rand(10000)
        material = Consts::DUNGEON_COCRETE_SYMBOL if material_roll > 5000
        dungeon_cell.symbol = material
        dungeon_cell.save
      end
    end
  end

  def self.random_room
    if rand(1) > 0
      return @big_room_size
    else
      return @small_room_size
    end
  end

  def self.create_room_path(area1, area2, cells)
    room_paths = Array.new
    if area1.x2 < DUNGEON_X_SIZE / 2 and DUNGEON_X_SIZE / 2 <= area2.x1
      if area2.room['x1'] - area1.room['x2'] < 3
        room_paths.push({"x1"=>area1.room['x2'], "y1"=>area1.room['y_center'], "x2"=>area2.room['x1'], "y2"=>area1.room['y_center']})
      else
        room_paths.push({"x1"=>area1.room['x2'], "y1"=>area1.room['y_center'], "x2"=>area1.x2, "y2"=>area1.room['y_center']})
        room_paths.push({"x1"=>area1.x2, "y1"=>area1.room['y_center'], "x2"=>area1.x2, "y2"=>area2.room['y_center']})
        room_paths.push({"x1"=>area1.x2, "y1"=>area2.room['y_center'], "x2"=>area2.room['x1'], "y2"=>area2.room['y_center']})
      end
    elsif area1.y2 < DUNGEON_Y_SIZE / 2 and DUNGEON_Y_SIZE / 2 <= area2.y1
      if area2.room['y1'] - area1.room['y2'] < 3
        room_paths.push({"x1"=>area1.room['x_center'], "y1"=>area1.room['y2'], "x2"=>area1.room['x_center'], "y2"=>area2.room['y1']})
      else
        room_paths.push({"x1"=>area1.room['x_center'], "y1"=>area1.room['y2'], "x2"=>area1.room['x_center'], "y2"=>area1.y2})
        room_paths.push({"x1"=>area1.room['x_center'], "y1"=>area1.y2, "x2"=>area2.room['x_center'], "y2"=>area1.y2})
        room_paths.push({"x1"=>area2.room['x_center'], "y1"=>area1.y2, "x2"=>area2.room['x_center'], "y2"=>area2.room['y1']})
      end
    end
    # Fill out paths
    room_paths.each do |room_path|
      path_x1 = room_path['x1']
      path_x2 = room_path['x2']
      if room_path['x1'] > room_path['x2']
        path_x1 = room_path['x2']
        path_x2 = room_path['x1']
      end
      path_y1 = room_path['y1']
      path_y2 = room_path['y2']
      if room_path['y1'] > room_path['y2']
        path_y1 = room_path['y2']
        path_y2 = room_path['y1']
      end

      for y in path_y1..path_y2 do
        for x in path_x1..path_x2 do
          cells[x][y] = Consts::DUNGEON_COCRETE_SYMBOL
          p x.to_s + "," + y.to_s
        end
      end
    end
  end

  class Area
    attr_accessor :x1, :y1, :x2, :y2, :room
    def initialize(x, y, s)
      @x1 = x
      @y1 = y
      @x2 = x + s - 1
      @y2 = y + s - 1
      @size = s
    end

    def set_room(s)
      @room = Hash.new
      @room['x1'] = @x1 + rand(@size - s - 2) + 1
      @room['y1'] = @y1 + rand(@size - s - 2) + 1
      @room['x2'] = @room['x1'] + s - 1
      @room['y2'] = @room['y1'] + s - 1
      @room['x_center'] = (@room['x1'] + (@room['x2'] - @room['x1']) / 2).round 
      @room['y_center'] = (@room['y1'] + (@room['y2'] - @room['y1']) / 2).round 
    end

    def update_cels(cells)
      # Fill out room
      for y in @y1..@y2 do
        for x in @x1..@x2 do
          if x.between?(@room['x1'], @room['x2']) and y.between?(@room['y1'], @room['y2'])
            cells[x][y] = Consts::DUNGEON_COCRETE_SYMBOL
          end
        end
      end
      # Fill out paths
      @exit_paths.each do |exit_path|
        for y in exit_path['y1']..exit_path['y2'] do
          for x in exit_path['x1']..exit_path['x2'] do
            cells[x][y] = Consts::DUNGEON_COCRETE_SYMBOL
          end
        end
      end
    end
    
    def set_exit_path(must_flg)
      @exit_paths = Array.new
      until @exit_paths.length > 0 do
        if rand(2) > 0
          # 1st and 3rd quadrant
          if @y2 < DUNGEON_Y_SIZE / 2
            # from Y top
            @exit_paths.push({"x1"=>@room['x_center'], "y1"=>@y1, "x2"=>@room['x_center'], "y2"=>@room['y1']})
          else
            # from Y bottom
            @exit_paths.push({"x1"=>@room['x_center'], "y1"=>@room['y2'], "x2"=>@room['x_center'], "y2"=>@y2})
          end
        end
        # 2nd and 4th quadrant
        if rand(2) > 0
          if @x2 < DUNGEON_X_SIZE / 2
            # from X left
            @exit_paths.push({"x1"=>@x1, "y1"=>@room['y_center'], "x2"=>@room['x1'], "y2"=>@room['y_center']})
          else
            # from X right
            @exit_paths.push({"x1"=>@room['x2'], "y1"=>@room['y_center'], "x2"=>@x2, "y2"=>@room['y_center']})
          end
        end
        break unless must_flg
      end
      #p @exit_paths
    end
  end
end