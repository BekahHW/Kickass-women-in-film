class Kaw::CLI

  def start
    puts "Welcome to Kickass Women in film!"
    puts "Let's get started with a sample of movies with amazing female characters."
    KawCli::Scraper.scrape_heroines
    list
  end

def list
  puts "Here is a list of ten movies with kickass heroines."
  @title = kawCLI::Filmography
  @title.each.with_index(1) {|movie, i| "#{i}. #{movie}"}


end
