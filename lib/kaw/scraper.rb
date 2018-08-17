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

def self.scrape_indiv_movies
  Kaw::Filmography.all.each do |movie|
    doc = Nokogiri::HTML(open(movie_url))

    doc.css(".panel-body content_body").each do |content|

      info = content.css("movie_synopsis clamp clamp-6")
      ##need to figure out how to scrape data that's generically labeled
      screenwriter = content.css(".li metarow clearfix meta-value")
      director = content.css(".li metarow clearfix meta-value")
end
