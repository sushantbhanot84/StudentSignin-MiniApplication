require_relative 'student.rb'
require_relative 'DataFile.rb'
class Signup
    
    def self.take_credentials
        @@username=gets.chomp.to_s
        @@firstname=gets.chomp.to_s
        @@lastname=gets.chomp.to_s
        @@email=gets.chomp.to_s
        @@password=gets.chomp.to_s

        if(self.validate_username?)
            @@username=Student.new(@@firstname,@@lastname,@@email,@@username,@@password)
            @@password=@@username.create_hash_digest(@@password)
            @@username.password=@@password
            #creating a hashed password not directly storing the password in db
            $users << {firstname: @@firstname, lastname: @@lastname,username: @@username, email: @email, password: @@password}
            puts "USER CREATED TAKING YOU TO HOME PAGE"
            @@username.welcome_page;
        else
            puts "Username already taken"
        end
    end

    def self.validate_username?
        $users.each do |user|
            if user[:username].username==@@username || user[:email]==@@email
                return false 
            end
        end
        return true
    end
end

class Signin 

    def self.validate_credentials?
        $users.each do |user|
            if user[:username].username==@@username && user[:password]==@@password 
                return user[:username]
            end  
        end
        return false;
    end

    public
    def self.take_credentials
        @@username=gets.chomp.to_s
        @@password=gets.chomp.to_s
        if(x=self.validate_credentials?)
            puts "Welcome Coming"
            x.welcome_page;
        else
            puts "WRONG"
        end
    end
end

puts "Welcome to our page"
print '-'*20
puts "Press 1 for Sign up and 2 for Sign in"
x=gets.to_i
case(x)
when 1
    Signup.take_credentials
when 2
    Signin.take_credentials
else
    raise StandardError.exception
end
puts $users