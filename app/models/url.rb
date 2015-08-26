class Url < ActiveRecord::Base
  validates :original, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }

  def shorten
    last = Url.last

    if last.nil? # seed
      latest = '0'
    else # continue as normal
      latest = last.short
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

      latest = rest.reverse.join + incrementor
    end

    self.short = latest
  end

end