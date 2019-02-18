# Scripts module for training
module Scripts
  def self.reverse_odds(str, odd_index = 1)
    return str unless str.length > 1

    aux = str[odd_index]
    str[odd_index] = str[str.length - 1 - odd_index]
    str[str.length - 1 - odd_index] = aux
    next_odd_index = odd_index + 2
    return str unless next_odd_index < str.length / 2

    reverse_odds str, next_odd_index
  end
  # generate_password method

  # At least 8, but no more than 32 characters.
  # At least one UPPERCASE letter.
  # At least one lowercase letter.
  # At least one special character: ~ ! @ # $ % ^ * ( ) _ - + = { } [ ] | : ; " , ?. Do not use < > & or '.
  # At least one number.

  def self.generate_password()
    random_generator = Random.new
    password_length = random_generator.rand(8...32)
    symbols = [
      '~', '!', '@', '#', '$', '%', '^', '*', '(', ')', '_', '-', '+',
      '=', '{', '}', '[', ']', '|', ':', ';', '"', ',', '?', '.'
    ]
    password = mix_chars(('A'...'Z'), ('a'...'z'), (0...9), symbols, password_length)
    password.shuffle!.join('')
  end

  def self.mix_chars(*ranges, max_length)
    initial_max = max_length + 1 - ranges.length
    ranges.reduce([[], initial_max]) do |acc, range|
      items = range.to_a.sample(acc[1])
      [acc[0] + items, acc[1] + items.length + 1]
    end
  end
end

String.class_eval do
  def palindrome?
    self === reverse
  end
end
