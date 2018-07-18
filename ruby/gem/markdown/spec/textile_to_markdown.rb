require 'reverse_markdown'
require 'RedCloth'

textile = <<-EOM
h1. header1

* list
* list
* list

h2. header2
EOM

html = RedCloth.new(textile).to_html
markdown = ReverseMarkdown.convert(html)

puts html
