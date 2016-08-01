require 'benchmark/ips'
n = 50_000
Benchmark.ips do |x|
  x.report 'sub' do
    n.times do
      'hello world'.sub 'l', '*'
    end
  end
  
  x.report 'sub!' do
    n.times do
      'hello world'.sub! 'l', '*'
    end
  end
  x.compare!
end

# Warming up --------------------------------------
#                  sub     2.000  i/100ms
#                 sub!     2.000  i/100ms
# Calculating -------------------------------------
#                  sub     23.430  (± 0.0%) i/s -    118.000  in   5.036563s
#                 sub!     25.801  (± 0.0%) i/s -    130.000  in   5.038869s

# Comparison:
#                 sub!:       25.8 i/s
#                  sub:       23.4 i/s - 1.10x slower

