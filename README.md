# cheapest-flight-path
This Ruby script calculates the cheapest flight path between two airports using a priority queue algorithm to determine the lowest cost based on flight connections.

## Features
- **Cheapest Path Calculation**: Finds the lowest-cost path between two airports.
- **Path Display**: Shows the total cost and the sequence of airports.

## How to Run

### Prerequisites
Make sure Ruby is installed on your system. You can verify this by running:
  ```bash
  ruby -v
  ```

# Running the Script
  ```bash
  ruby airport_graph.rb
  ```
# Input Start and End Airports
  ```bash
  Enter the starting airport (e.g., ISB):
  ISB
  Enter the destination airport (e.g., NYC):
  NYC
  ```

# Output
  ```bash
  Cheapest path: ISB -> LHR -> NYC
  Cost: 1750
  ```

## Example Airports and Routes
  ```bash
  airports = [
    { start: 'ISB', end: 'LHR', cost: 1000 },
    { start: 'LHR', end: 'NYC', cost: 750 },
    { start: 'CBS', end: 'NYC', cost: 775 },
    { start: 'ISB', end: 'CBS', cost: 575 },
    { start: 'CBS', end: 'GRC', cost: 731 },
    { start: 'NYC', end: 'GRC', cost: 459 }
  ]
  ```
