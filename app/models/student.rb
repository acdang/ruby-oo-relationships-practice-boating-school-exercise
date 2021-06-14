class Student
    attr_accessor :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_tests
        BoatingTest.all.select {|boating_test| boating_test.student == self}
    end

    def all_instructors
        self.all_tests.map {|boating_test| boating_test.instructor}
    end

    def self.find_student(first_name)
        self.all.select {|student| student.first_name == first_name}
    end

    def grade_percentage
        (self.all_tests.select {|boating_test| boating_test.status == "passed"}.count).to_f / self.all_tests.count
    end 
end
