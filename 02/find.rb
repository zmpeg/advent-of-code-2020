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
		count = p[3].count p[2]
		valid += 1 if count >= p[0] && count <= p[1]
	end
	p valid
}
puts time.real
