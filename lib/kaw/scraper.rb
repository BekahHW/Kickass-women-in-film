require 'pry'
class Kaw::Scraper

  BASE_URL = "https://editorial.rottentomatoes.com/article/fearless-female-movie-heroes-who-inspire-us/"

  # def initialize(movie_url = nil )
  #   @movie_url = movie_url
  # end
  #
  # def scrape_content
  #   @doc = Nokogiri::HTML(open(@movie_url))
  #   @doc.search(".div.panel_body content_body").text
  # end


  def self.scrape_heroines
    @doc = Nokogiri::HTML(open(BASE_URL))

    # doc.css(".articleContentBody").each do |content|
    @doc.search(".articleContentBody .clearfix").each do |each_movie|

    movie = Kaw::Filmography.new
      # (title, score, heroine_rank, movie_url)


      movie.title = each_movie.search("a").text.strip
      movie.score = each_movie.search(".tMeterScore").text
      movie.heroine_rank = each_movie.search(".edit-rank").text
      movie.movie_url = each_movie.search("a").attr("href")
      movie.info = each_movie.search(".col-sm-20 p").text
      movie.year = each_movie.search("h2 .subtle").text
# binding.pry
      page = Nokogiri::HTML(open(movie.movie_url))

      # movie.extended_movie_details = page.search(".media-body .panel-body content_body").text

# movie.extended_movie_details = page.search(".media-body").text.strip.gsub(/\n/, "")
# movie.extended_movie_details = page.search(".media-body").text.gsub(/\n/, "")
movie.extended_movie_details = page.search("div.media-body ul").text.gsub(/\n/, "").strip



      movie.save
    end
  end


  # def self.scrape_indiv_movies
  #
  #   extended_movie_details = []
  #   # Kaw::Filmography.all.each do |movie|
  #     @doc = Nokogiri::HTML(open(movie_url))
  #     @doc.search(".panel-body content_body").each do |content|
  #
  #       # indiv_movie = Kaw::Filmography.new
  #
  #
  #       indiv_movie.additional_details = content.search(".content-meta info")
  #       ##need to figure out how to scrape data that's generically labeled
  #       # screenwriter = content.css(".li metarow clearfix meta-value")
  #       # director = content.css(".li metarow clearfix meta-value")
  #
  #       # indiv_movie.save
  #       extended_movie_details
  #     end
  #   end
  # end

end
