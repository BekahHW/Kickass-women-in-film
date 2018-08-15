class Kaw::CLI

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
    movies = Kaw::Filmography.all

    #TODO add the random method to select 10 random movies
    #TODO make sure the list only returns 10

    #iterates over each of the movies in the @@all array, and creates a numbered list.
    movies.each.with_index(1) {|movie, i|  puts "#{i}. #{movie.title}"}
    select_list
  end

  def select_list
    puts "Please select a movie (using its number)"

    #get the users' input without spacing
    input = gets.strip

    #convert input and only allow user to chose a number between 1 and the size of the array.
    if index = input.to_i.between(1, Movie.size.all)
      movie = Movie.all[index]

      puts "Here are the details:"

      puts "movie.title"
      puts "movie.screenwriter"
      puts "movie.score"
    else
      puts "Try a different number from the list."
    end
  end

  def more_info
    puts "Would you like more info about the movie? Y/N"

    input = gets.strip

    if input == "Y" || input == "y"
      #open the link for the movie
    else
      puts "Thanks for choosing, enjoy your movie!"
    end
  end


end
