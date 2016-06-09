class Movie < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user

  attr_accessor :titles, :release_dates, :posters, :data
  attr_reader :key, :headers, :base_uri

  @base_uri = 'http://api.themoviedb.org/3/search/movie'
  @headers = {:accept => 'application/json'}
  @key = ENV["SECRET_API_KEY"]

  def self.search(title)
    title_words = CGI::escape(title)
    response = RestClient.get "#{@base_uri}?api_key=#{@key}&query=#{title_words}", @headers

    if response.succ!
      @data = JSON.parse(response)
      results = @data["results"]

      movie_results = []
      results.each do |result|
        movie = {}
        movie["id"]             = result["id"]
        movie["original_title"] = result["original_title"]
        movie["release_date"]   = result["release_date"]
        movie["poster_path"]    = result["poster_path"]
        movie_results.push(movie)
      end
      return movie_results
    end
  end
end
