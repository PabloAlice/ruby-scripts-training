require 'rspec'

require '../lib/my_script'

describe 'My Scripts' do
  it 'should reverse the odd indexed characters' do
    str = 'hello world!'
    expect(Scripts.reverse_odds('hello world')).to eq 'hlloo wlred'
    expect(Scripts.reverse_odds('hello world!')).to eq 'hdlrow olle!'
    expect(Scripts.reverse_odds(str)).to equal str
  end

  it 'should generate an proper password' do
    regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[~|!|@|#|\$|%|\^|\*|\(|\)|_|-|\+|=|\{|\}|\[|\]|\||:|;|"|,|\?|\.|])(?=.*[0-9]).{8,}$/
    expect(Scripts.generate_password).to match regexp
    expect(Scripts.generate_password).to match regexp
    expect(Scripts.generate_password).to match regexp
    expect(Scripts.generate_password).to match regexp
    expect(Scripts.generate_password).to match regexp
  end
end

describe '#palindrome?' do
  it 'returns true if string is a palindrome' do
    expect('arepera'.palindrome?).to be true
  end

  it 'returns false if string is not a palindrome' do
    expect('arepa'.palindrome?).to be false
  end
end
