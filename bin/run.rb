require_relative '../config/environment'

$prompt = TTY::Prompt.new

$current_user = ''

def read_content(poem)
    spawn "say '#{poem.content}'"
    poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }  
end 

def fav_poem(poem)
    fav = Favorite.create(poem_id: poem.id, user_id: $current_user.id)
    puts "NEW FAV MADE #{fav.poem.title}" 
end


def find_poem
    poem_list = Poem.all.map { |poem| poem.title }
    response = $prompt.select("Select your favorite poem.", poem_list)
    poem = Poem.find_by(title: response)
    # binding.pry 
    user_option = $prompt.select("Save your favorite poem.", ["Fav", "Read"])
    if user_option == "Read"
     read_content(poem)
    elsif user_option == "Fav"
      fav_poem(poem)
    end 
end     

    def update_or_delete_fav_poem(response)
       change_option = $prompt.select("Do you want to update or delete?", ["Update", "Delete"])
       binding.pry 
        
       if user_option == "Delete" 
           .reload 
            fav.destroy  
            #call .delete or .destroy on fav_poem of $curruser  method #
            # fav_poem(poem)
        elsif user_option == "Update"
            Favorite.poem.find_by(title: poem)
            puts "You mispelled the title!" 
        end       
    end 

    def display_favs
      my_favs = Favorite.all.select {|favorite| favorite.user_id == $current_user.id }
      my_poems = my_favs.map {|fav| fav.poem }
      my_titles = my_poems.map {|poem| poem.title }
      response = $prompt.select("Select your favorite poem titles", my_titles)
    end


def all_poets 
    poet_list = Poet.all.map {|poet| poet.name}
    # binding.pry 
    response = $prompt.select("Select your favorite poet.", poet_list)
    poet = Poet.find_by(name: response)  

    content_list = poet.poems.map { |poem| poem.content }  
    content_response = $prompt.select("Poems", content_list) 
    # binding.pry 

    poet_content = Poet.find_by(content: content_response)
    spawn "say '#{poem.content}'"
    poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }
end 

def main_menu
    user_input = $prompt.select("What would you like to do?", [
        "Find a Poem to Read",
        "See all Poets",
        "See your favorites",
        "Exit"
    ])
    case  user_input 
    when "Find a Poem to Read" 
        find_poem 
    when "See all Poets"  
        all_poets

    when "See your favorites"
        display_favs
  
    end  
end 

def start_program
    user_login = $prompt
    .select("Sign In or Create Profile?", ["Login", "Create"])
    if user_login == "Login"
        puts "whats your email?"
        user_email = gets.chomp
        $current_user = User.find_by(email: user_email)
        if $current_user.nil?
            puts "Cannot find a user with that email..."
            sleep(1)
            puts "exiting..."
            sleep(1)
            return false
        end

        main_menu  
    
    elsif 
        user_login == "Create"
        puts "Create your profile"
        user_name = $prompt.ask("What is your name?")
        user_email = $prompt.ask("What is your email?")
        user_password = $prompt.ask("What is your password?")
        $current_user = User.create(name: user_name, email: user_email, password: user_password ) 
        main_menu
    end 
end
 
start_program
 
 


# user_input = prompt.ask("What is your username?")

# user_email = prompt.ask("Please enter yout email") do |q|
#     q.validate(/\A\w+@\w+\.\w+\Z/)
#     q.messages[:valid?] = "Invalid email address"
#   end

# user_password = prompt.mask("Please enter your password:")






# user_input = nil

# while user_input != "Exit"
#     user_input = $prompt.select("What would you like to do?", [
#         "Find a Poem to Read",
#         "See all Poets",
#         "Exit"
#     ])
#     case  user_input 
#     when "Find a Poem to Read" 
#         poem_list = Poem.all.map { |poem| poem.title }
#         response = $prompt.select("Select your favorite poem.", poem_list)
#         poem = Poem.find_by(title: response)  
#         spawn "say '#{poem.content}'"
#         poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }   
#     when "See all Poets"
#         poet_list = Poet.all.map {|poet| poet.name}
#         response = $prompt.select("Select your favorite poet.", poet_list)
#         poet = Poet.find_by(name: response)  
        
#         content_list = poet.poems.map { |poem| poem.content }  
#         content_response = $prompt.select("Poems", content_list) 
        
#         poet_content = Poet.find_by(content: content_response)
#         spawn "say '#{poem.content}'"
#         poem.content.each_char {|c| putc c ; sleep 0.07; $stdout.flush }
#     end  
# end

    # def fav_user()
    #     if user_input == 'Select your favorite poem.'
    #         fav_response =  $prompt.ask("Save your favorite poem")
    #         poem = Poem.find_by(title: fav_response)
    #     # elsif
    #     #    user_input == "Select your favorite poet."   
    #     end    
    # end



#     case  user_input 
#         when "Find a Poem to Read" 
#             poem_list = Poem.all.map { |poem| poem.title }
#             response = prompt.select("Select your favorite poem.", poem_list)
#             poem = Poem.find_by(title: response)            


#     # when user_input == "See all Poets"

    
# end

# Favorite.create(user_id: current_user.id, poem_id:)

# user_selection = prompt.select("Choose a poem to read", poem_list)







       












