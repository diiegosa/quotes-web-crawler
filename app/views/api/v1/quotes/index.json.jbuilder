json.quotes do
  json.array! @quotes do |quote|
    json.text quote.text
    json.author quote.author.name
    json.author_about quote.author.about
    json.tags quote.tags
  end
end
