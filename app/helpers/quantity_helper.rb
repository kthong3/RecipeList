module QuantityHelper
  def is_rational?(object)
    true if Rational(object) rescue false
  end

  def mixed_number_to_rational(amount)
    rational_to_return = 0
    amount.split(" ").each { |string|
      if is_rational?(string)
        if string.include?("/")
          rational_to_return += Rational(string)
        elsif string.to_i == string.to_f
          rational_to_return += string.to_i
        elsif string.include?(".")
          rational_to_return += Rational(string)
        else
          return false
        end
      else
        return false
      end
    }
    rational_to_return
  end
end
