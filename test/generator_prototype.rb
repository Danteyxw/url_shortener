latest = nil

while true

  # seed
  if latest.nil?
    latest = '0'
  end

  a = latest.split("")
  incrementor = a.last
  carry_over = false

  # deal with incrementor
  if incrementor == '9'
    incrementor = 'a'
  elsif incrementor == 'z'
    incrementor = '0'
    carry_over = true
  else
    incrementor.next!
  end

  # deal with the rest
  a.pop
  rest = []
  unless a.nil?
    a.reverse.each do |char|
      if char == '9' && carry_over
        result = 'a'
        carry_over = false
      elsif char == 'z' && carry_over
        result = '0'
      elsif carry_over
        result = char.next
        carry_over = false
      else
        result = char
      end
      rest << result
    end
  end

  if carry_over
    rest << '0'
  end
  p latest = rest.reverse.join + incrementor
  gets

end

# thoughts
=begin
  changes occur when char is 9 or z
  9 -> a, no carry over
  z -> 0, carry over 1
=end