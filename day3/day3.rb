content = File.read "input.txt"

sum = 0

for match in content.scan(/mul\(\d+,\d+\)/) do
	nums = /(\d+),(\d+)/.match(match)
	sum += Integer(nums[1]) * Integer(nums[2])
end

puts "Part 1: " + String(sum)

sum = 0
doing = true
for i in 0..content.length() do
	if content[i..(i + 6)] == "don't()" then
		doing = false
	end

	if content[i..(i + 3)] == "do()" then
		doing = true
	end

	next_match = /mul\(\d+,\d+\)/.match(content[i..])
	if doing and next_match != nil and content[i..(i + next_match[0].length() - 1)] == next_match[0] then
		nums = /(\d+),(\d+)/.match(next_match[0])
		sum += Integer(nums[1]) * Integer(nums[2])
	end
end

puts "Part 2: " + String(sum)