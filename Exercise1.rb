class Table

  attr_accessor :table_name, :recaudations
  def initialize(name, *recaudations)
  	@table_name = name
  	@recaudations = recaudations.map(&:to_i)
  end

  def self.build(file)
  	tables = []
  	File.readlines(file).each do |line|
  		table_info_array = line.chomp.split(', ')
  		name, recaudations = table_info_array.shift, table_info_array
  		tables << Table.new(name, *recaudations)
  	end
  	tables
  end

  def self.bigger(file)
  	table = build(file)
  	table.each {|ele| puts "#{ele.table_name} >> #{ele.recaudations.max} day #{ele.recaudations.index(ele.recaudations.max)+1}"}
  end

  def self.average(file)
  	table = build(file)
	total = 0
	puts 'averages'
  	table.each do |ele|
  	average = ele.recaudations.inject(&:+) /ele.recaudations.size.to_f
  		puts "#{ele.table_name}: #{average}"
  		total += average
 	end 
 	total /= 4
 	puts "whit a total of: #{total}"
  end
end

Table.bigger('casino.txt')
Table.average('casino.txt')
