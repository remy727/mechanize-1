require "rubygems"
require "mechanize"

agent = Mechanize.new

# Print all the links presents on the page
page = agent.get("file:///Users/admin/Documents/projects/own/mechanize-1/demo.html")
page.links.each do |link|
  puts link
end

# Find specific link
contact_link = page.link_with(text: "contact")
contact_page = contact_link.click

text = contact_page.at("span").text
puts text

form = page.form
form["q"] = "write_anything"
submit_form = form.submit

puts submit_form.uri.to_s
