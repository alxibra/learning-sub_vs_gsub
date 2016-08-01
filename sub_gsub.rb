puts 'hello world'.sub 'l', '*'
puts 'hello world'.gsub 'l', '*'

require 'benchmark/ips'
n = 50_000
Benchmark.ips do |x|
  x.report 'sub' do
    n.times do
      'hello world'.sub 'l', '*'
    end
  end
  
  x.report 'gsub' do
    n.times do
      'hello world'.gsub 'l', '*'
    end
  end
  x.compare!
end

# he*lo world
# he**o wor*d
# Warming up --------------------------------------
#                  sub     2.000  i/100ms
#                 gsub     1.000  i/100ms
# Calculating -------------------------------------
#                  sub     23.507  (± 0.0%) i/s -    118.000  in   5.020221s
#                 gsub     10.380  (± 0.0%) i/s -     52.000  in   5.010131s

# Comparison:
#                  sub:       23.5 i/s
#                 gsub:       10.4 i/s - 2.26x slower

