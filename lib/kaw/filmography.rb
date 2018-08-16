class Kaw::Filmography

  attr_accessor :title, :screenwriter, :director, :info, :score, :heroine_rank

  @@all = []

  def initialize(title, screenwriter, director, info, score, heroine_rank, type_of_credit)
    @title = title
    @screenwriter = screenwriter
    @director = director
    @info = info
    @score = score
    @heroine_rank = heroine_rank
    @type_of_credit = type_of_credit
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_movie_by_name(title)
    if  self.all.find {|movie| movie.title == title}
    else
      puts "Try another movie with a kickass heroine!"
  end
end

  def self.find_movie_by_screenwriter(screenwriter)
    if self.all.find {|movie| movie.screenwriter == screenwriter}
    else
      puts "Try another screenwriter."
    end
  end

end
