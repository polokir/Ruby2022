require 'date'

class Student
  attr_accessor :surname,:group,:geometryMark,:algebraMark,:infoMark
  attr_reader :avarageMark

  def initialize(surname,group,geometryMark,algebraMark,infoMark)
    @surname=surname
    @group=group
    @geometryMark=geometryMark
    @algebraMark=algebraMark
    @infoMark=infoMark
    @avarageMark = ((geometryMark+algebraMark+infoMark)/3.0).to_f
  end
end

class Session
  attr_accessor :date
  attr_reader :studentsList

  def initialize(date)
    @date=date
    @studentsList = Array.new
    @studentsList.each { |student| @studentsList << student.dup }
  end

  def addStudent(student)
    @studentsList.append(student)
  end

  def percentSucces
    count=0
    @studentsList.each do |student|
      if student.geometryMark>3 && student.algebraMark>3 && student.infoMark>3
        count+=1
    end
    end
    percentage= count/@studentsList.count
    printf ("Percentage of 4 and 5 " +percentage.to_s)
    return percentage
  end

  def debtDisplayer
    @studentsList.each do |student|
      if student.geometryMark<3
        printf(student.surname + " has a debt geometry" +"\n")
      end

      if student.algebraMark<3
        printf(student.surname + " has a debt algebra" +"\n")
      end

      if student.infoMark<3
        printf(student.surname + " has a debt info" +"\n")
      end
    end
  end


  def maxMark
    @studentsList.each do |student|
      m1=[student.geometryMark,student.algebraMark,student.infoMark].max
      printf(student.surname + "the highest mark " + m1.to_s + "\n")
    end
  end

  def sortAvarage
    @studentsList=@studentsList.sort_by {|student| student.avarageMark}
    @studentsList=@studentsList.reverse
    @studentsList.each do |student|
      printf(student.group + " " + student.avarageMark.to_s + "\n")
    end
  end
end

ss=Session.new("07.12.2021")
ss.addStudent(Student.new("Petrov","P-01",5,3,5))
ss.addStudent(Student.new("Ivanov","P-02",4,4,4))
ss.addStudent(Student.new("Negrov","P-03",5,5,3))
ss.addStudent(Student.new("Belov","P-04",3,3,2))
ss.addStudent(Student.new("Pupkin","P-05",2,4,5))
ss.addStudent(Student.new("Zalupkin","P-06",1,5,5))
ss.addStudent(Student.new("Pechkin","P-07",4,3,4))

# ss.addStudent(Student.new("Vasylenko","P-07",4,4,4))
# ss.addStudent(Student.new("Sardelko","P-07",4,4,4))
# ss.addStudent(Student.new("Yurchenko","P-07",4,4,4))

# p ss.debtDisplayer
# p ss.maxMark
p ss.sortAvarage



