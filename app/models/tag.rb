class Tag
  include Mongoid::Document
  field :name, type: String
  embeds_many :quotes

  def self.get_quotes_by_tag_name(tag_name)
    return [] if Tag.first.nil?
    tag = find_by(name: tag_name)
    tag.nil? ? [] : tag.quotes
  end
end
