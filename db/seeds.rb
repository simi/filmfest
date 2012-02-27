# encoding: UTF-8

# prepare user
::Refinery::User.new(username: 'retro', email: 'retro@ballgag.cz', password: 'retro').create_first
::Refinery::Setting.create(name: 'Email', value: 'retro@ballgag.cz', destroyable: false)

# seed pages
if Refinery::Page.where(:menu_match => "^/$").empty?
  home_page = Refinery::Page.create!({:title => "Karlín Film Fest",
              :deletable => false,
              :link_url => "/",
              :menu_match => "^/$"})
  home_page.parts.create({
                :title => "Obsah",
                :body => '<span class="thumbnail"><img src="http://placehold.it/770x400" /></span><h2>Novinky</h2><p>12.5.2012 - soutěž spuštěna</p>',
                :position => 0
              })
  home_page.parts.create({
                :title => "O festivalu",
                :body => '
<h2>O festivalu</h2>
<p>Když v roce 1946 slavila Praha a spolu s ní celá Československá republika první výročí ukončení válečného konfliktu, zrodil se současně s oslavami 50. výročí založení <a href="http://www.ceskafilharmonie.cz/">České filharmonie</a> Mezinárodní hudební festival Pražské jaro.</p>
<p>V jeho vzniku se zúročily dlouholeté, bezmála sedmdesát let trvající snahy pražské hudební veřejnosti včetně německy hovořící menšiny o pořádání každoročních hudebních slavností s účastí špičkových sólistů a předních orchestrů z celého světa.</p>
<p>U jejich počátků byly v osmdesátých letech 19. století autorské operní cykly pražského <a href="http://cs.wikipedia.org/wiki/Státní_opera_Praha">Neues Deutsches Theater</a>, pořádané od roku 1900 až do vypuknutí 1. světové války pod názvem Mai-Festspiele, kdy se k původně jen operním představením přidaly rovněž činoherní inscenace a koncerty. Mezitím se k této iniciativě přidalo vlastními operními cykly českých skladatelů také Národní divadlo a na jaře roku 1904 se uskutečnil i první památný <a href="http://www.ucps.cz/portal/cz/01-01-clanek.php?see_ID=250">Český hudební festival</a>, na němž se už podílela Česká filharmonie.</p>
<p>V meziválečných letech se podobné velkorysé hudební svátky s účastí zahraničních umělců uskutečnily v Praze třikrát pod patronací <a href="http://www.iscm.org/">Mezinárodní společnosti pro soudobou hudbu</a> (ISCM). V pohnutém období nacistického protektorátu oživil snahy o konání pravidelného festivalu v podobě Pražských hudebních májů dirigent Václav Talich.</p>
<p>U kolébky vlastní historie Pražských jar v prvním poválečném roce stál další z velkých českých dirigentů, umělecký šéf České filharmonie <a href="http://cs.wikipedia.org/wiki/Rafael_Kubelík">Rafael Kubelík</a>. Od samého počátku se tato iniciativa setkala s příznivým přijetím u české kulturní veřejnosti i politické reprezentace, když záštitu nad novým festivalem převzal prezident Československé republiky Edvard Beneš, který ve své zdravici napsal:</p>
                ',
                :position => 1
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
                :body => '
<ol>
  <li>Zákaz kouření v areálu festivalu.</li>
  <li>Je zakázáno přechovávat a konzumovat alkoholické nápoje v areálu festivalu.</li>
  <li>Je zakázáno přechovávat nebo užívat toxické nebo návykové látky v areálu festivalu.</li>
  <li>Bude-li návštěvník přistižen v podnapilém stavu či pod vlivem návykových látek a jiných drog, bude z festivalu okamžitě vyloučen bez nároku na vrácení peněz.</li>
  <li>Návštěvníci jsou povinni nosit jmenovky na viditelném místě.</li>
  <li>Návštěvníci jsou povinni házet odpad pouze do odpadkových košů, nikam jinam.</li>
  <li>Pokud někdo znečistí prostory festivalu, je povinen dát je do původního stavu.</li>
  <li>Je zakázáno ničit nebo odcizit cizí majetek v budově i v okolí budovy.</li>
  <li>Za poškození vybavení či techniky bude požadována náhrada v plné výši škody.</li>
  <li>Za své osobní věci si návštěvníci ručí sami. Při ztrátě cennosti nahlásit organizátorovi.</li>
  <li>Návštěvníci jsou povinni se řídit pokyny organizátora.</li>
  <li>Je zakázáno běhat v areálu, hlavně po schodech.</li>
  <li>V areálu jsou zakázány veškeré sexuální aktivity a praktiky.</li>
  <li>Od 22:00 do 07:00 je povinné dodržovat noční klid.</li>
  <li> Zákaz pohybu mimo uvedené prostory.</li>
  <li>Budova se zavírá v 22:00.</li>
  <li>Tělocvična bude v sobotu v době od 12:00 do 20:00 uzavřena. Otevřena bude pouze v nutných případech.</li>
  <li>Neznalost pravidel neomlouvá.</li>
  <li>Zakoupením vstupenky se návštěvník zavazuje k dodržování všech těchto pravidel, při neuposlechnutí může být návštěvník vyloučen z festivalu bez nároku na vrácení vstupného.</li>
</ol>
                ',
                :position => 0
              })
end
