class Kaw::Filmography

  attr_accessor :title, :screenwriter, :director, :info, :score, :heroine_rank, :movie_url

  @@all = []

  # def initialize(title, heroine_rank, score, movie_url)
  #   @title = title
  #   @score = score
  #   @heroine_rank = heroine_rank
  #   @movie_url = movie_url
  #
  #   @@all << self
  # end

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

  # def self.create(title, heroine_rank, score)
  #   movie =  self.new(title, heroine_rank, score)
  #   movie.save
  #   movies
  # end



end
