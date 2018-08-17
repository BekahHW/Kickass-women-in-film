require 'pry'
class Kaw::CLI

  # attr_accessor :filmography

  def start
    puts "Welcome to Kickass Women in film!"
    puts ""
    puts "Let's get started with a sample of movies with amazing female characters."
    puts ""
    list
  end

  def list
    puts "Here is a list of ten movies with kickass heroines:"
    Kaw::Scraper.scrape_heroines
    movies = Kaw::Filmography.all.sample(10)
    #iterates over each of the movies in the @@all array, and creates a numbered list.
    movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
      # - heroine rank #{movie.heroine_rank} - overall score #{movie.score}
    end
    select_list(movies)
  end

  def select_list(movies)
    puts ""
    puts "Which movie would you like to know more about?"

    # @sample = movies.each {|movie| movie.title == input}

    input = gets.strip

    if input.to_i.between?(1, movies.length)
      index = input.to_i - 1
      # if it is, display movie
      # binding.pry

      selected = movies[index]
      # Kaw::Filmography.all[index]
      # selected.each do |movie|

      puts "Overall Score: #{selected.score}"
      puts "#{selected.info}"

       # puts "Here's the info:"
       #
       # Kaw::Scraper.scrape_indiv_movies

       # #put info from the indiv movies page
       #      puts movies.info
       #      puts movies.screenwriter
       #      puts movies.score
     # end
        elsif
          input == "exit"
          puts "Thank you for using Badass Women in Film"
        else
          puts ""
          puts "Try a different title from the list."
          puts ""
          list
        end
      end


  end

    #if title entered matches title on the list
    # if input == Kaw::CLI.find_by_title(filmography)

    #convert input and only allow user to chose a number between 1 and the size of the array.
    # if input.to_i.between?(1, 10)
    #   index = input.to_i - 1

      # movie = Kaw::Filmography.all[index]

  #     puts "Here are the details:"
  #
  #       puts movie.title
  #       puts movie.screenwriter
  #       puts movie.score
  #   else
  #     puts "Try a different number from the list."
  #   end
  # end

#   def more_info
#     puts "Would you like more info about the movie? Y/N"
#
#     input = gets.strip
#
#     if input == "Y" || input == "y"
#       #open the link for the movie and scrape director and screenwriter
#       puts "Here are more details:"
#       puts movie.screenwriter
#       puts movie.director
#       puts "Would you like more information about the screenwriter?"
#     else
#       puts "Thanks for choosing, enjoy your movie!"
#     end
#   end
#
#
# end
