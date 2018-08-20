require 'pry'
class Kaw::CLI

  # attr_accessor :filmography

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

      selected = movies[index]
# binding.pry
      puts "#{selected.title}"
      puts "OVERALL SCORE: #{selected.score}"
      puts "YEAR: #{selected.year}"
      puts ""
      # binding.pry
      #if the third place in the string is a number, gsub space, elsif the second space is a number, gsub space, else do nothing.
      puts "HEROINE SCORE AND SUMMARY: #{selected.info}"

      puts ""
      puts "Would you like to see more?"
      puts ""
      puts "Y/N"
      answer = gets.strip
      if ["Y"].include?(answer.upcase)
          # binding.pry
        Kaw::Scraper.scrape_heroines

        # content = Kaw::Filmography.scrape_content(url)
        # Need to scrape new info from second page
        # master: selected.open_in_browser

        puts "#{selected.extended_movie_details}"
        # binding.pry

        puts "Would you like to go to the movie page?"
        puts ""
        puts "Y/N"

        response = gets.strip


          if ["Y"].include?(response.upcase)

            puts "#{selected.open_in_browser}"

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
  end
      # end

      # def to_page
      #
      #
      #
      #     filmography.open_in_browser
      #   end
      #   end
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
