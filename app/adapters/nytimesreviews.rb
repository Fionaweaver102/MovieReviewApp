module NyTimesReviews

  class Adapter

    api_key = "UaI3AqlycGp1MvYzI39BucGG3Rsn9OYx"
    URL = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?api-key=#{api_key}"

    def get_reviews 

      reviews = JSON.parse(RestClient.get(URL))

      reviews["results"].each do |review|
        @review = Review.new(name: review["byline"], movie_title: review["display_title"], review_description: review["summary_short"], image: review["multimedia"]["src"], date_published: review["publication_date"])
        @review.save 
      end 

    end 

  end 
  
end 
