# Fill out the rest of the Ruby code below so it prints output like that shown 
# in "Sample Output." You should read the text from a simple text file that you 
# provide. (We also supply some example text below, but try the program with 
# your text as well.)

# This question requires that you read a simple text file. Try searching the Web 
# for information on how to do this, and also take a look at the File class in 
#   the Ruby documentation. If you can't figure it out on your own, don't worry: 
#   just put the data directly into your program; an Array with one element per 
#   line would be ideal.

# Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample 
# output but should have the indicated format.

class TextAnalyzer
  def process
    lines = 0
    paragraphs = 1
    words = 0

    yield.each do |line|
      lines += 1
      line == "\n" ? paragraphs += 1 : words += line.count(' ') + 1
    end
    puts "#{paragraphs} paragraphs\n#{lines} lines\n#{words} words"
  end
end

analyzer = TextAnalyzer.new
analyzer.process { File.open('sample_text1.txt', 'r') }
analyzer.process { File.open('sample_text2.txt', 'r') }
analyzer.process { File.open('sample_text3.txt', 'r') }

# Sample Output:

# 3 paragraphs
# 15 lines
# 126 words

class TextAnalyzer
  def process
    File.open('sample_text1.txt', 'r') do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split.size} words"}
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split("\n\n").size } paragraphs" }
