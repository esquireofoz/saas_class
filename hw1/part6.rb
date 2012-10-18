class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    @src_currency = singular_currency
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(dst_currency)
    (1 / @@currencies[dst_currency.to_s.gsub( /s$/, '')]) * self
  end
end

class String
  def palindrome?
    tmp_str = self.downcase.gsub(/[^a-z]/,'')
    tmp_str.reverse == tmp_str
  end
end

module Enumerable
  def palindrome?
    self == self.reverse
  rescue NoMethodError
    self.to_a == self.to_a.reverse
  end
end

