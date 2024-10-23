class AirportGraph
  def initialize(airports)
    @graph = {}
    airports.each do |connection|
      start = connection[:start]
      destination = connection[:end]
      cost = connection[:cost]

      @graph[start] ||= []
      @graph[start] << { end: destination, cost: cost }
    end
  end

  def find_cheapest_path(start, finish)
    return nil unless @graph[start]

    # Priority queue for the cheapest cost
    queue = [[0, start, []]] # [cost, current_airport, path]
    visited = {}

    until queue.empty?
      cost, current_airport, path = queue.shift
      path = path + [current_airport]

      #checking if destination is reached
      return { path: path, cost: cost } if current_airport == finish

      #skip of the airport is already visited with cheaper cost
      next if visited[current_airport] && visited[current_airport] <= cost
      visited[current_airport] = cost

      # Explore neighbors
      if @graph[current_airport]
        @graph[current_airport].each do |neighbor|
          new_cost = cost + neighbor[:cost]
          queue.push([new_cost, neighbor[:end], path])
        end
      end

      queue.sort_by!(&:first)
    end

    #no path is found
    nil
  end
end

airports = [
  { start: 'ISB', end: 'LHR', cost: 1000 },
  { start: 'LHR', end: 'NYC', cost: 750 },
  { start: 'CBS', end: 'NYC', cost: 775 },
  { start: 'ISB', end: 'CBS', cost: 575 },
  { start: 'CBS', end: 'GRC', cost: 731 },
  { start: 'NYC', end: 'GRC', cost: 459 }
]

graph = AirportGraph.new(airports)

# INput the starting airport
puts "Enter the starting airport (e.g., ISB):"
start_airport = gets.chomp.upcase

# input the destination airport
puts "Enter the destination airport (e.g., NYC):"
end_airport = gets.chomp.upcase

# Finding the cheapest path
result = graph.find_cheapest_path(start_airport, end_airport)

if result
  puts "Cheapest path: #{result[:path].join(' -> ')}"
  puts "Cost: #{result[:cost]}"
else
  puts "No path found from #{start_airport} to #{end_airport}."
end
