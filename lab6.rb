require 'date'

class Student
  attr_accessor :surname,:group,:geometryMark,:algebraMark,:infoMark

  def initialize(surname,group,geometryMark,algebraMark,infoMark)
    @surname=surname
    @group=group
    @geometryMark=geometryMark
    @algebraMark=algebraMark
    @infoMark=infoMark
    @avarageMark = (geometryMark+algebraMark+infoMark)/3
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
    return count/@studentsList.count
  end

  def debtDisplayer
    @studentsList.each do |student|
      if student.geometryMark<3
        printf(student.surname + " has a debt geometry")
      end

      if student.algebraMark<3
        printf(student.surname + " has a debt algebra")
      end

      if student.infoMark<3
        printf(student.surname + " has a debt info")
      end
    end
  end


  def maxMark
    @studentsList.each do |student|
      m1=[student.geometryMark,student.algebraMark,student.infoMark].max
      printf(student.surname + "the highest mark" + m1.to_s)
    end
  end

  def sortAvarage
    @studentsList.sort_by {|student| student.avarageMark }
    @studentsList.each do |student|
      printf(student.group + " " + student.avarageMark + "\n")
    end
  end
end
