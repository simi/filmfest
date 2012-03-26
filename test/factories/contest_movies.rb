# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # ["name", "anotation", "year", "director_name", "director_surname",
  #   "director_year", "screenwriter_name", "screenwriter_surname",
  #   "screenwriter_year", "category_id", "genre", "actors",
  #   "informations", "youtube_link", "surname", "address",
  #   "telephone", "email"]
  factory :movie, :class => ::Refinery::Contest::Movie do
    sequence(:name) {|n| "Film ##{n}"}
    anotation "test"
    year 2010
    director_name "Josef"
    director_surname "Šimánek"
    director_year {rand(10) + 1990}
    screenwriter_name "Jarda"
    screenwriter_surname "Hejnic"
    screenwriter_year {rand(10) + 1990}
    category_id {rand(3)+1}
    genre "Źánr"
    actors "Herci"
    informations "inforamce"
    youtube_link "http://www.youtube.com/watch?v=_PVyiw4tcqs"
    surname "Kontaktní týpek"
    address "Koněvova\nPraha3"
    telephone "723 174 329"
    email "kamil@ryba.cz"
  end
end
