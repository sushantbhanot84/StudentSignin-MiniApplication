

# users=[
#     {username: "user1", password: "password1"},
#     {username: "user2", password: "password2"},
#     {username: "user3", password: "password3"},
#     {username: "user4", password: "password4"},
#     {username: "user5", password: "password5"},
# ]

module Crud
    require 'Bcrypt'
    puts "Module Crud Activated"
    
    def self.create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def create_hash_digest(password)
        BCrypt::Password.create(password)
    end

    def self.validate_hash_digest(pass_hash)#Varification methodology
        BCrypt::Password.new(pass_hash) 
    end

    def validate_hash_digest(pass_hash)#Varification methodology
        BCrypt::Password.new(pass_hash) 
    end

    def self.create_secure_users(user)
        user.each do |hashset|
            hashset[:password]=create_hash_digest(hashset[:password])
        end
    end

    def create_secure_users(user)
        user.each do |hashset|
            hashset[:password]=create_hash_digest(hashset[:password])
        end
    end

    def self.authenticate_user(username,password,list_of_users)
        list_of_users.each do |user|
            if(user[:username]==username && validate_hash_digest(user[:password])==password)
                return user
            end
        end
        "Credentials were not correct!!!"
    end

    def authenticate_user(username,password,list_of_users)
        list_of_users.each do |user|
            if(user[:username]==username && validate_hash_digest(user[:password])==password)
                return user
            end
        end
        "Credentials were not correct!!!"
    end
end

# new_users= create_secure_users(users)
# puts new_users
# puts authenticate_user("user1","password1",new_users)
