require "questions_test"

describe QuestionsTest do

  describe '.create' do
    context "if given no parameters" do
      it "returns false" do
        expect(QuestionsTest.create("")).to eql(false)
      end
    end
  end
end
