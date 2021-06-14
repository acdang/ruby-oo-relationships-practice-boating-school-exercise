require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
kim = Student.new("Kim") # 1
tony = Student.new("Tony") # 2
victoria = Student.new("Victoria") # 3
anh = Student.new("Anh") # 4

stella = Instructor.new("Stella")
kayla = Instructor.new("Kayla")
trang = Instructor.new("Trang")
cece = Instructor.new("CeCe")

kim_test1 = kim.add_boating_test("Kim Test 1", "pending", stella)

tony_test1 = tony.add_boating_test("Tony Test 1", "failed", kayla)
tony_test2 = tony.add_boating_test("Tony Test 2", "passed", trang)

victoria_test1 = victoria.add_boating_test("Victoria Test 1", "passed", cece)
victoria_test2 = victoria.add_boating_test("Victoria Test 2", "failed", stella)
victoria_test3 = victoria.add_boating_test("Victoria Test 3", "pending", kayla)

anh_test1 = anh.add_boating_test("Anh Test 1", "pending", trang)
anh_test2 = anh.add_boating_test("Anh Test 2", "failed", cece)
anh_test3 = anh.add_boating_test("Anh Test 3", "failed", stella)
anh_test4 = anh.add_boating_test("Anh Test 4", "passed", kayla)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

