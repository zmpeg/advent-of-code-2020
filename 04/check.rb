#!/usr/bin/env ruby


# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
#     If cm, the number must be at least 150 and at most 193.
#     If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f. 
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.



passports = File.read("passports.txt")
  .split("\n\n")
  .map do |r|
    o = {}
    r = r.strip.split(/[\s]/)
    r.each do |kv|
      kv = kv.split(":")
      o[kv[0]] = kv[1]
    end
    o
  end

required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]

valid = 0

passports.each do |p|
  valid += 1 if (p.keys & required_fields).length == 7
end

p passports.length
p valid
