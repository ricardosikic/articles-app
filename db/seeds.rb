# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin require 'nokogiri'
require 'open-uri'

class Scrapper
    attr_accessor :url
    
    # Constructor
    def initialize(url)
        @url = url
    end
    
    def get_title
        web_url.css('.media__title').css('.media__link').each do |title|

            title.text.strip().to_s
        end
    end

    def get_description
        web_url.css('.media__summary').each do |desc|

            desc.text.strip().to_s
        end
    end

    private

    def web_url
        page_url = Nokogiri::HTML(open(url))
    end
end



times = 0

while times <= 1
    ob = Scrapper.new('https://www.bbc.com/')
    ob.get_title
    ob.get_description
    
    Article.create(title: ob.get_title, description: ob.get_description)

    times += 1

    if times == 1
        break
    end
end

Article.create(title: 'primero', description: 'uno descripcion') =end

