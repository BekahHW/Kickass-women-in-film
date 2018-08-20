class Kaw::Filmography

  attr_accessor :title, :info, :score, :heroine_rank, :movie_url, :year

  @@all = []

  def open_in_browser
    system("open '#{movie_url}'")
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
