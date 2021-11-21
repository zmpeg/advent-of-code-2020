#!/usr/bin/env ruby

def t(forest, across, down)
  trees = 0
  pos = 0
  forest.each.with_index do |l, i|
    if i % down == 0 then
      trees += 1 if l[pos] == "#"
      pos += across
      pos -= 31 if pos >= 31
    end
  end
  trees
end

forest = File.readlines("forest.txt")
  .map{|l| l.strip.chars}

trees = []
trees.push t(forest, 1, 1)
trees.push t(forest, 3, 1)
trees.push t(forest, 5, 1)
trees.push t(forest, 7, 1)
trees.push t(forest, 1, 2)


p trees.inject(:*)

