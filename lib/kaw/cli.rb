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

    movies = Kaw::Filmography.all.sample(10)
    movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
    select_list(movies)
  end

  def select_list(movies)
    puts ""
    puts "Which movie would you like to know more about?"

    input = gets.strip

    if input.to_i.between?(1, movies.length)
      index = input.to_i - 1

      selected = movies[index]
      puts "#{selected.title}"
      puts "OVERALL SCORE: #{selected.score}"
      puts "YEAR: puts #{selected.year}"
      puts ""
      puts "HEROINE SCORE AND SUMMARY: #{selected.info}"

      puts ""
      puts "Would you like to see more?"
      puts ""
      puts "Y/N"
      answer = gets.strip
      if ["Y"].include?(answer.upcase)
        selected.open_in_browser

      else
        puts "Thank you for using Badass Women in Film"
        puts ""
        puts "Here's the list if you want to select another film."
        puts ""

        list
      end
    end
  end
end
