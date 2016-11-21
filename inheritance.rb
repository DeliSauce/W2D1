class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, salary, title, boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee
  def initialize(name, salary, title, boss, employees)
    @employees = employees
    super(name, salary, title, boss)
  end

  def bonus(multiplier)
    total_salary * multiplier
  end

  def total_salary
    sub_salary_total = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sub_salary_total += (employee.salary + employee.total_salary)
      else
        sub_salary_total += employee.salary
      end
    end
    sub_salary_total
  end

end

 shawna = Employee.new("Shawna", 12_000, "TA", "Darren")
 david = Employee.new("David", 10_000, "TA", "Darren")
 darren = Manager.new("Darren", 78_000, "TA Manager", "Ned", [shawna, david])
 ned = Manager.new("Ned", 1_000_000, "Founder", nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
