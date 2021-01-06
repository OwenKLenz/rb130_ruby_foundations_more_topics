# Write a minitest assertion that will fail unless employee.hire raises a 
# NoExperienceError exception.
require 'minitest/autorun'

class NoExperienceError < StandardError; end

class OverqualifiedError < StandardError; end


class Employee
  def initialize(years_experience=0)
    @experience = years_experience
  end

  def hire
    raise NoExperienceError if @experience == 0
    raise OverqualifiedError if @experience > 5
  end
end

class EmployeeExperienceTest < MiniTest::Test
  def setup
    @employee1 = Employee.new
    @employee2 = Employee.new(10) 
  end

  def test_no_experience_error_raised
    assert_raises(NoExperienceError) do 
      @employee1.hire
    end

    assert_raises(NoExperienceError) do
      @employee2.hire
    end
  end
end