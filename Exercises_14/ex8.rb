def print_own_code
  File::open($0, "r") do |file|
    file.readlines.each do |line|
      puts line.to_s
    end
  end
end

print_own_code
