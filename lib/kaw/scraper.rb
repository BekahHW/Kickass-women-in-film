require 'pry'
class Kaw::Scraper

BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

def self.scrape_heroines
  doc = Nokogiri::HTML(open(BASE_URL))

  doc.css(".articleContentBody").each do |content|
  content.css(".clearfix").each do |movie|
      # binding.pry

    title = movie.css("a").text

    title = movie.css("a").text.strip
    score = movie.css(".tMeterScore").text
    heroine_rank = movie.css(".edit-rank").text
    screenwriter = nil
    info = nil
    director = nil
    type_of_credit = nil

    Kaw::Filmography.new(title, screenwriter, director, info, score, heroine_rank, type_of_credit)
    end
  end
end

end
