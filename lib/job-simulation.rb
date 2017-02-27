require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    number_of_workers = jobs_available # available are filled and become employees
    number_on_waitlist = job_seekers - jobs_available # seekers overfill become waitlist

    @workers = Stack.new
    number_of_workers.times { |number| @workers.push "Worker ##{number+1}" }

    @waiting = Queue.new
    number_on_waitlist.times { |number| @waiting.enqueue "Waitlist ##{number+1}" }
  end

  def cycle
    @roll = rand(1..6)
    @roll.times { |number| @workers.pop }
    @roll.times { |number| @workers.push(@waiting.dequeue) }
  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
