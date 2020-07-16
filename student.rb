require_relative 'Crud.rb'

class Student
    include Crud;
    #better is usage of attribute accessors as they provide both getters and setters
    attr_accessor :firstname, :lastname, :password, :email  #these are attribute accessors
    attr_accessor :username   #only read username not write

    def initialize(firstname,lastname,email,username,password)
        self.firstname=firstname
        self.lastname=lastname
        self.email=email
        self.username=username
        self.password=password
    end

    def to_s
        "Hello! #{@firstname} #{lastname}"
    end

    def welcome_page
        puts "Welcome #{self.firstname} this is our application's Welcome page"
    end

end
