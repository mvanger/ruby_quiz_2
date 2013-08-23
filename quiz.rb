#  _______  _______  ___   _______  __
# |       ||       ||   | |       ||  |
# |_     _||    ___||   | |    ___||  |
#   |   |  |   | __ |   | |   |___ |  |
#   |   |  |   ||  ||   | |    ___||__|
#   |   |  |   |_| ||   | |   |     __
#   |___|  |_______||___| |___|    |__|

QUIZ_TOPICS = ["ruby", "rspec", "testing", "arrays", "objects"]

# create a quiz object

# We can add numbers to it
# quiz = Quiz.new
# quiz.add(5)
# quiz.add(3)
class Quiz
  def initialize(numbers = [], trash = [])
    @numbers = numbers
    @trash = trash
  end

  def numbers
    @numbers.to_s
  end

  def trash
    @trash
  end

  def count(input)
    @numbers.count(input)
  end

  def rotate(length)
    @numbers.rotate!(length)
  end

  def count_events
    even = 0
    @numbers.each do |number|
      if number.even?
        even += 1
      end
    end
    return even
  end

  def add(number)
    if number.class == Fixnum
      @numbers << number
    elsif number.class == Array
      number.each do |index|
        if index.class == Fixnum
          @numbers << index
        else
          @trash << index
        end
      end
    else
      @trash << number
    end
  end
end

# We can see the numbers we've added
# quiz.numbers => "[5, 3]"

# We can only add numbers
# quiz.add("7")
# quiz.numbers => "[5, 3]"

# Or arrays of numbers
# quiz.add([4, 2, true, 9])
# quiz.numbers => "[5, 3, 4, 3]"

# We can't access the array directly
# quiz.numbers.push(5)
# => undefined method `push'

# Trash returns anything we've tried to add that's not a number.
# quiz.trash => ["7", true]

# Returns the number of occurences of a specified number
# quiz.numbers => "[5, 3, 4, 3]"
# quiz.count(3) => 2

# Takes a specified length of an array starting from the left and moves it to
# the tail end
# quiz.numbers => "[5, 3, 9, 4, 3]"
# quiz.rotate(2)
# quiz.numbers => "[9, 4, 3, 5, 3]"

# Prints out the number of even numbers in the array.
# quiz.numbers => "[9, 4, 3, 5, 3]"
# quiz.count_events => 1