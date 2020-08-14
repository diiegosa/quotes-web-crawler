class Author
  include Mongoid::Document
  field :name, type: String
  field :about, type: String

  def self.get_saved_instance(name, about)
    where(name: name, about: Crawler::BASE_URI+about).first_or_create
  end
end
