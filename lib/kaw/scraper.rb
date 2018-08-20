class Kaw::Scraper

  BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

  def initialize(movie_url = nil)
    @movie_url = movie_url
  end

  def self.scrape_heroines
    doc = Nokogiri::HTML(open(BASE_URL))

    doc.search(".articleContentBody .clearfix").each do |each_movie|

      movie = Kaw::Filmography.new

      movie.title = each_movie.search("a").text.strip
      movie.score = each_movie.search(".tMeterScore").text
      movie.heroine_rank = each_movie.search(".edit-rank").text
      movie.movie_url = each_movie.search("a").attr("href")
      movie.info = each_movie.search(".col-sm-20 p").text
      movie.year = each_movie.search("h2 .subtle").text

      movie.save
    end
  end


end
