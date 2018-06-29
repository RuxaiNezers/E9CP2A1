require 'date'
class Course
	attr_accessor :name, :dates
  def initialize(name, *dates)
  	@name = name
  	@dates = dates.map {|date| Date.parse(date)}
  end

  def self.build(file)
    tables = []
    File.readlines(file).each do |line|
  	  table_info_array = line.chomp.split(', ')
  	  name, dates = table_info_array.shift, table_info_array
  	  tables << new(name, *dates)
    end
    tables
  end

  def self.course_before_begining_date(file, filter_date = DateTime.now)
  	table = build(file)
  	#filter = Date.parse(filter_date)
  	if filter_date >= 2018-01-01
	  puts "the date is out of range"
	else
  	  selected_courses = []
  	  table.each do |courses|
  		selected_courses << courses.name if courses.dates[0] < filter_date
  	  end
  	  puts selected_courses
  	end
  end

  def self.course_after_ending_date(file, filter_date = DateTime.now)
	table = build(file)
  	filter = Date.parse(filter_date)
  	if filter >= 2018-01-01
  		puts "the date is out of range"
  	else
  	selected_courses = []
  	table.each do |courses|
  		selected_courses << courses.name if courses.dates[1] > filter
  	end
  	puts selected_courses
  	end
  end
end

Course.build('cursos.txt')
Course.course_before_begining_date('cursos.txt')
Course.course_after_ending_date('cursos.txt', '2019-05-20')
