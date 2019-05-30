require_relative '../config/environment'

prompt = TTY::Prompt.new

user_login = prompt
.select("Sign In or Create Profile?", ["Login", "Create"])

# current_user = ''

if user_login == "Login"
    puts "whats your email?"
    user_email = gets.chomp
    current_user = User.find_by(email: user_email) 
elsif 
    user_login == "Create"
    puts "Create your profile"
    user_name = prompt.ask("What is your name?")
    user_email = prompt.ask("What is your email?")
    user_password = prompt.ask("What is your password?")
    new_user = User.create(name: user_name, email: user_email, password: user_password ) 
end 

# user_input = prompt.ask("What is your username?")

# user_email = prompt.ask("Please enter yout email") do |q|
#     q.validate(/\A\w+@\w+\.\w+\Z/)
#     q.messages[:valid?] = "Invalid email address"
#   end

# user_password = prompt.mask("Please enter your password:")


user_input = nil

while user_input != "Exit"
    user_input = prompt.select("What would you like to do?", [
        "Find a Poem to Read",
        "See all Poets",
        "Exit"
    ])
    case  user_input 
    when "Find a Poem to Read" 
        poem_list = Poem.all.map { |poem| poem.title }
        response = prompt.select("Select your favorite poem.", poem_list)
        poem = Poem.find_by(title: response)  
        spawn "say '#{poem.content}'"
        poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }          

    when "See all Poets"
        poet_list = Poet.all.map {|poet| poet.name}
        response = prompt.select("Select your favorite poet.", poet_list)
        poet = Poet.find_by(name: response)  
        
        content_list = poet.poems.map { |poem| poem.content }  
        content_response = prompt.select("Poems", content_list) 
        
        poet_content = Poet.find_by(content: content_response)
        spawn "say '#{poem.content}'"
        poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }
    end  

  while user_input ==  "Find a poem to Read"
    user_fav = prompt.select("Choose your favorite poem ")




 end



#     case  user_input 
#         when "Find a Poem to Read" 
#             poem_list = Poem.all.map { |poem| poem.title }
#             response = prompt.select("Select your favorite poem.", poem_list)
#             poem = Poem.find_by(title: response)            


#     # when user_input == "See all Poets"

    
# end

# Favorite.create(user_id: current_user.id, poem_id:)

# user_selection = prompt.select("Choose a poem to read", poem_list)







       












