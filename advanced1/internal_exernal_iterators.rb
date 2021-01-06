fib = Enumerator.new(7) do |y|
  a = 1
  factorial = 1

  loop do
    y << a
    a *= factorial
    factorial += 1
  end
end



7.times do 
  p fib.next
end

fib.each_with_index do |el, ind|
  p el
  break if ind == 6
end