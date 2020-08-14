require 'nokogiri'
require 'open-uri'

class Crawler
  BASE_URI = "http://quotes.toscrape.com".freeze

  def self.pull
    # HTML parser
    doc = Nokogiri::HTML(open(BASE_URI))    
    doc.css('div.quote').each do |quoteDiv|
      quote_text = quoteDiv.search("span[itemprop=text]").text
      author_name = quoteDiv.search("small[itemprop=author]").text
      author_about = quoteDiv.search("a")[0]['href']
      tags = quoteDiv.search("meta")[0]["content"].split(",")
      
      # Save Author and Quote 
      author = Author.get_saved_instance(author_name, author_about)
      quote = Quote.get_saved_instance(quote_text, author, tags)
      
      # Save the Tags merged with the Quotes to optimize the query 
      tags.each do |tag_name| 
        tag = Tag.where(name: tag_name).first_or_initialize
        tag.quotes = tag.quotes + [quote] if !tag.quotes.include? quote
        tag.save
      end
    end
  end
end
