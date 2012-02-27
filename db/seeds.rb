# encoding: UTF-8
if Refinery::Page.where(:menu_match => "^/$").empty?
  home_page = Refinery::Page.create!({:title => "Karlín Film Fest",
              :deletable => false,
              :link_url => "/",
              :menu_match => "^/$"})
  home_page.parts.create({
                :title => "Obsah",
                :body => "<p>Vítejte na film festu.</p>",
                :position => 0
              })

  page_not_found_page = home_page.children.create(:title => "Stránka neexistuje",
              :menu_match => "^/404$",
              :show_in_menu => false,
              :deletable => false)
  page_not_found_page.parts.create({
                :title => "Obsah",
                :body => "<h2>Požadovaná stránka neexistuje...</h2></p>",
                :position => 0
              })
end

if Refinery::Page.by_title("Soutěžní filmy").empty?
  about_us_page = ::Refinery::Page.create(:title => "Soutěžní filmy")
  about_us_page.parts.create({
                :title => "Obsah",
                :body => "<p>Krátké info</p>",
                :position => 0
              })
end

if Refinery::Page.by_title("Přidat film").empty?
  about_us_page = ::Refinery::Page.create(:title => "Přidat film")
  about_us_page.parts.create({
                :title => "Obsah",
                :body => "<p>Krátké info</p>",
                :position => 0
              })
end

if Refinery::Page.by_title("Pravidla").empty?
  about_us_page = ::Refinery::Page.create(:title => "Pravidla")
  about_us_page.parts.create({
                :title => "Obsah",
                :body => "<p>Krátké info</p>",
                :position => 0
              })
end
