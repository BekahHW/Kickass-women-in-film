require 'pry'
class Kaw::CLI

  attr_accessor :filmography

  def start
    puts "Welcome to Kickass Women in film!"
    puts ""
    puts "Let's get started with a sample of movies with amazing female characters."
    puts ""
    Kaw::Scraper.scrape_heroines
    list
  end

  def list
    puts "Here is a list of ten movies with kickass heroines:"
    @movies = Kaw::Filmography.all.sample(10)
    # binding.pry

    #TODO add the random method to select 10 random movies
    #TODO make sure the list only returns 10
# binding.pry
    #iterates over each of the movies in the @@all array, and creates a numbered list.
    @movies.each.with_index(1) {|movie, i|  puts "#{i}. #{movie.title} - heroine rank #{movie.heroine_rank} - overall score #{movie.score}"}

    puts ""
    puts "Please select a movie (using its title)"

# @sample = @movies.each {|movie| Kaw::Filmography.title}

    input = gets.strip
binding.pry

if   Kaw::Filmography.all.detect {|t| }

        puts movie.title
        puts movie.screenwriter
        puts movie.score
    elsif
      input = exit
      puts "Thank you for using Badass Women in Film"
    else
      puts ""
      puts "Try a different title from the list."
      puts ""
      list

  end

    # select_list
  end

  # def self.find_by_title(filmography)
  #     Kaw::Filmography.all.select {|t| t.title == title}
  # end

  def select_list
    puts ""
    puts "Please select a movie (using its title)"

    #get the users' input without spacing
    # input = gets.strip
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

  def more_info
    puts "Would you like more info about the movie? Y/N"

    input = gets.strip

    if input == "Y" || input == "y"
      #open the link for the movie and scrape director and screenwriter
      puts "Here are more details:"
      puts movie.screenwriter
      puts movie.director
      puts "Would you like more information about the screenwriter?"
    else
      puts "Thanks for choosing, enjoy your movie!"
    end
  end


end
