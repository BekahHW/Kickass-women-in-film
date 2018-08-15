class Kaw::Scraper

BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

def self.scrape_heroines
  doc = Nokogiri::HTML(open(BASE_URL))

  doc.css("col-sm-20 article_movie_title h2 a").each do |movie|

    title = movie.css()

end
