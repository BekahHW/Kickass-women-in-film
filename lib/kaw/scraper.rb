class Kaw::Scraper

BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

def self.scrape_heroines
  doc = Nokogiri::HTML(open(BASE_URL))

  doc.css("container body_main").each do |content|
    content.css("clearfix").each do |movie|

    title = movie.css("col-sm-20 article_movie_title h2 a").text
    score = movie.css("col-sm-20 article_movie_title h2 tMeterScore").text
    heroine_rank = movie.css("edit ranks").text
    end
  end
end

end
