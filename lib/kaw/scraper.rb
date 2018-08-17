require 'pry'
class Kaw::Scraper

BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

def self.scrape_heroines
  doc = Nokogiri::HTML(open(BASE_URL))

  doc.css(".articleContentBody").each do |content|
  content.css(".clearfix").each do |movie|
      # binding.pry

    title = movie.css("a").text.strip
    score = movie.css(".tMeterScore").text
    heroine_rank = movie.css(".edit-rank").text
    movie_url = movie.css("a")[0].attr("href")

    Kaw::Filmography.new(title, heroine_rank, score, movie_url)
    end
  end
end

end
