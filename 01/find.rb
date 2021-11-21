#!/usr/bin/env ruby

require 'benchmark'

nums = File.readlines('numbers.txt').map{|n| Integer(n.strip)}

time = Benchmark.measure {

	nums.each do |i|
		if nums.include?(2020-i) then
			p (i*(2020-i))
			break
		end
	end

	
	# nums.each do |i|
	# 	nums.each do |j|
	# 		p (i*j) && break if i + j == 2020
	# 	end
	# end

}
puts time.real




