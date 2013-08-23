require_relative '../quiz'
#  __    __    _______  __    __
# |  |  |  |  /  _____||  |  |  |
# |  |  |  | |  |  __  |  |__|  |
# |  |  |  | |  | |_ | |   __   |
# |  `--'  | |  |__| | |  |  |  |
#  \______/   \______| |__|  |__|

describe "a quiz" do
  it "should be about Ruby and Testing in Rspec" do
    expect(QUIZ_TOPICS).to include("ruby")
    expect(QUIZ_TOPICS).to include("rspec")
    expect(QUIZ_TOPICS).to include("testing")
  end

  it "can make a new quiz" do
    expect(Quiz.new.class).to be(Quiz)
  end

  it "has an array of numbers" do
    expect(Quiz.new.numbers.class).to be(String)
  end

  it "can add numbers to the array" do
    quiz = Quiz.new
    quiz.add(5)
    expect(quiz.numbers_as_array).to include(5)
  end

  it "returns an array of numbers" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(8)
    expect(quiz.numbers).to eq("[5, 8]")
  end

  it "can only add numbers" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add(8)
    quiz.add("7")
    expect(quiz.numbers).to eq("[5, 8]")
  end

  it "can add numbers from an array" do
    quiz = Quiz.new
    quiz.add(5)
    quiz.add([1, 2, "string"])
    expect(quiz.numbers).to eq("[5, 1, 2]")
  end

  it "trashes non numbers" do
    quiz = Quiz.new
    quiz.add("5")
    quiz.add([1, 2, "string", true])
    expect(quiz.trash).to eq(["5", "string", true])
  end

  it "counts instances of a number" do
    quiz = Quiz.new
    quiz.add([1, 2, 4, 2])
    expect(quiz.count(2)).to eq(2)
  end

  it "rotates the numbers" do
    quiz = Quiz.new
    quiz.add([5, 3, 9, 4, 3])
    quiz.rotate(2)
    expect(quiz.numbers).to eq("[9, 4, 3, 5, 3]")
  end

  it "prints out the number of even numbers" do
    quiz = Quiz.new
    quiz.add([9, 4, 3, 5, 3])
    expect(quiz.count_events).to eq(1)
  end

  it "cant access numbers directly" do
    quiz = Quiz.new
    expect{quiz.numbers.push(5)}.to raise_error(NoMethodError)
  end
end


# more in quiz.rb!