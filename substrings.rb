# Asks user for dictionary input
puts "Enter the first word you want in your dictionary:"
dictionary = []
dictionary << gets.chomp
while dictionary.last != "yz"
  puts "Enter yz if you\'re done and your next word if you're not!"
  dictionary << gets.chomp
end
dictionary.pop

# Allows user to verify dictionary words and gets string input
puts "These are the words in your dictionary: " + dictionary.to_s + "\n" + "Now, what is the string you would like the dictionary to check for?"
user_input = gets.downcase.chomp

def substrings(user_input, dictionary)
  # Adds words from the dictionary found in the string each time it is found to an array
  appeared_words = []
  dictionary.each do |word|
    user_input.downcase.scan(word) do |match|
      appeared_words << match 
    end
  end
  # Performs count of words and presents the results in a hash
  result = appeared_words.reduce(Hash.new(0)) do |hash, word|
    hash[word] += 1
    hash
  end
  result
end