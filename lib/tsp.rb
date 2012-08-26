
module TSP
  TSP_REGEX = /^(?<point>\d+)\s+(?<coord1>\d+(\.\d+)?)\s+(?<coord2>\d+(\.\d+)?)/

  # Parse the *.tsp file into an Hash where the key is the point and 
  # the value is the location of the point.
  #
  # input_file  => A string (not a file-descriptor)
  # 
  # The value is in the format of:
  #   { x: c1, y: c2 }
  # Yes, I am assuming a 2-dimensional space
  def self.parse( input_file )
    points = {}

    lines = input_file.split( "\n" )
    lines.each do |line|
      match = TSP_REGEX.match( line )
      if match
        points[match[:point].to_sym] = {
          x: match[:coord1].to_f,
          y: match[:coord2].to_f
        }
      end
    end

    points
  end

end
