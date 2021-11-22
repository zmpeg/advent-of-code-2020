#!/usr/bin/env ruby


# byr (Birth Year) - four digits; at least 1920 and at most 2002.
def vbyr(o) (o["byr"].to_i >= 1920 && o["byr"].to_i <= 2002) end

# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
def viyr(o) (o["iyr"].to_i >= 2010 && o["iyr"].to_i <= 2020) end

# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
def veyr(o) (o["eyr"].to_i >= 2020 && o["eyr"].to_i <= 2030) end

# hgt (Height) - a number followed by either cm or in:
#     If cm, the number must be at least 150 and at most 193.
#     If in, the number must be at least 59 and at most 76.
def vhgt(o)
  h = o["hgt"]
  return false if h.to_i.to_s == h
  return false unless h
  u = h[-2,2]
  h = h[0,h.length-2].to_i
  (u=="cm" && h>=150 && h<=193) || (u=="in" && h>=59 && h<=76)
end

# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f. 
def vhcl(o) /\#[0-9a-f]{6}/.match(o["hcl"]) end

# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
def vecl(o) ["amb","blu","brn","gry","grn","hzl","oth"].include?(o["ecl"]) end

# pid (Passport ID) - a nine-digit number, including leading zeroes.
def vpid(o) /^[0-9]{9}$/.match(o["pid"]) end

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

valid = 0
passports.each do |p|
  valid += 1 if vbyr(p) && viyr(p) && veyr(p) && vecl(p) && vpid(p) && vhgt(p) && vhcl(p)
end
p "#{valid} of #{passports.length} are valid"
