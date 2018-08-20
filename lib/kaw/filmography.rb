class Kaw::Filmography

  attr_accessor :title, :info, :score, :heroine_rank, :movie_url, :year, :additional_details, :extended_movie_details

  @@all = []

def open_in_browser
  system("open '#{movie_url}'")
end

def content
  @content ||= Kaw::Scraper.new(movie_url).scrape_content
end

  def self.all
    @@all
  end
#
#   def self.find_movie_by_name(title)
#     if  self.all.find {|movie| movie.title == title}
#     else
#       puts "Try another movie with a kickass heroine!"
#   end
# end
#
#   def self.find_movie_by_screenwriter(screenwriter)
#     if self.all.find {|movie| movie.screenwriter == screenwriter}
#     else
#       puts "Try another screenwriter."
#     end
#   end

  def save
    @@all << self
  end
end
