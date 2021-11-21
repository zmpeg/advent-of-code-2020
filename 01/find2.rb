#!/usr/bin/env ruby

require 'benchmark'

nums = File.readlines('numbers.txt').map{|n| Integer(n.strip)}

time = Benchmark.measure {

	nums.each do |i|
		break unless nums.each do |j|
			break unless nums.each do |k|
				if (i+j+k) == 2020 then
					p "#{i} + #{j} + #{k} = #{(i+j+k)}"
					p i*j*k
					break
				end
			end
		end
	end

}
puts time.real




