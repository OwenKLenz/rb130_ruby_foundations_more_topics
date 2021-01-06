# Write a method that returns a list of all of the divisors of the positive 
# integer passed in as an argument. The return value can be in any sequence 
# you wish.

# Algo:
# starting from 1, result = num / current_num
# unless result is a float,  append current num and num / current num to return 
# array if num / current_num is less than current_num, break

def divisors(n)
  current_num = 1
  divs = []
  loop do
    result = n.divmod(current_num)
    return divs.uniq.sort if result[0] < current_num
    divs.concat([result[0], current_num]) if result[1].zero?
    current_num += 1
  end
end

time1 = Time.now
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)
time2 = Time.now
puts "That took #{time2 - time1}"

def divisors(n)
  current_num = 1
  divs = []
  loop do
    return divs.uniq.sort if current_num > Math.sqrt(n)
    if n % current_num == 0
      divs += [current_num, (n / current_num)]
    end
    current_num += 1
  end
end

# Examples
time1 = Time.now
p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)
time2 = Time.now
puts "That took #{time2 - time1}"
