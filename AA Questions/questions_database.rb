
require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database 
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end 

end 

class User
    attr_accessor :id, :fname , :lastname 
    
    def  self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT 
                * 
            FROM 
                users
            WHERE 
                users.id = ?
        SQL
        # debugger
        # User.new(users)
        return users
    end 

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname , lname)
            SELECT 
                * 
            FROM 
                users
            WHERE
                fname = user.fname 
                AND lname = user.lname
        SQL
        User.new(user)

    end 
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 


end 

# p User.find_by_name("Lori", "Tamosaitis") 
p User.find_by_id(1)