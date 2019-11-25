require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(name)
    if !@salaries.has_key?name
      return false
    end
    true
  end

  def >(start_up)
    if self.funding < start_up.funding
      return false
    end
    true
  end

  def hire(name, title)
    if !self.valid_title?(title)
      raise
    end

    @employees << Employee.new(name, title)
  end

  def size
    @employees.count
  end

  def pay_employee(employee)
    amount = self.salaries[employee.title]
    if amount > @funding
      raise
    end

    employee.pay(amount)
    @funding -= amount
  end

  def payday
    @employees.each do |employee|
      self.pay_employee(employee)
    end
  end

  def average_salary
    sum = 0
    @employees.each { |employee| sum += salaries[employee.title] }
    sum / @employees.length 
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding

    startup.salaries.each do |title, amount|
      if !@salaries.has_key?(title)
        @salaries[title] = amount
      end
    end

    @employees = @employees + startup.employees
    startup.close
  end
end
