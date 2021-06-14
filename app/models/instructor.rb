class Instructor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def all_tests
        BoatingTest.all.select {|boating_test| boating_test.instructor == self}
    end
    
    def all_passed_tests
        self.all_tests.select {|boating_test| boating_test.status == "passed"}
    end

    def passed_students
        self.all_passed_tests.map {|boating_test| boating_test.student}
    end

    def add_boating_test(student, test_name, test_status)
        BoatingTest.new(student, test_name, test_status, self)
    end

    def matching_test(student, test_name)
        BoatingTest.all.find {|boating_test| boating_test.student == student && boating_test.name == test_name}
    end

    def pass_student(student, test_name)
        match = self.matching_test(student, test_name)
        match ? 
        (match.status = "passed") && match :
        self.add_boating_test(student, test_name, "passed")
    end 

    def fail_student(student, test_name)
        match = self.matching_test(student, test_name)
        match ?
        (match.status = "failed") && match :
        self.add_boating_test(student, test_name, "failed")
    end 

    def all_students
        self.all_tests.map {|test| test.student}
    end
end
