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
