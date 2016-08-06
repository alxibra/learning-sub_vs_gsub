require 'benchmark/ips'
n = 50_000
Benchmark.ips do |x|
  x.report 'gsub' do
    n.times do
      'hello world'.gsub 'l', '*'
    end
  end
  
  x.report 'gsub!' do
    n.times do
      'hello world'.gsub! 'l', '*'
    end
  end
  x.compare!
end

# warming up --------------------------------------
#                 gsub     1.000  i/100ms
#                gsub!     1.000  i/100ms
# Calculating -------------------------------------
#                 gsub      6.307  (± 0.0%) i/s -     32.000  in   5.074123s
#                gsub!      6.202  (± 0.0%) i/s -     32.000  in   5.159736s

# Comparison:
#                 gsub:        6.3 i/s
#                gsub!:        6.2 i/s - 1.02x slower

