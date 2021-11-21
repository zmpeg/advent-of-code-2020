#!/usr/bin/env ruby

require 'benchmark'

passwords = File.readlines('passwords.txt').map do |p|
	p = p.delete(":").strip.split /[\-, ]/
	p[0] = p[0].to_i
	p[1] = p[1].to_i
	p
end

time = Benchmark.measure {

	valid = 0
	passwords.each do |p|
		matches = [p[3][p[0]-1], p[3][p[1]-1]]
		valid += 1 if matches[0] != matches[1] && matches.include?(p[2])
	end
	p valid
}
puts time.real
