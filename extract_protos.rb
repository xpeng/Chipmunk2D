FORMAT = ARGV[0]

# match 0 is the whole function proto
# match 1 is the return value
# match 2 returns pointer?
# match 3 is the function name
# match 4 is the remainder
REGEX = /.*?((\w+(\s+\*)?)\s*(cp\w*)\(.*?\))(.*)/

STDIN.readlines.each do|str|
	while match = REGEX.match(str)
		captures = match.captures
		proto, ret, ignored, sym, str = captures
		break if ret == "return"
		
		puts eval('"' + FORMAT + '"') || "#{sym}: #{proto}"
	end
end
