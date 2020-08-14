class Quote
  include Mongoid::Document
  field :text, type: String
  field :tags, type: Array
  embeds_one :author
  
  def self.get_saved_instance(text, author, tags)
    where(text: text).first_or_create(author: author, tags: tags)
  end

  def self.get_by_tag_name(tag_name)
    Tag.get_quotes_by_tag_name(tag_name)
  end
end
