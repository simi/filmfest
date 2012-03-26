module Refinery
  module Contest
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Contest

      engine_name :refinery_contest

      initializer "register refinerycms_movies plugin" do |app|
        Refinery::Plugin.register do |plugin|
          plugin.name = "movies"
          plugin.url = {
            :controller => 'refinery/contest/admin/movies',
            :action => 'index'
          }
          plugin.pathname = root

          plugin.activity = {
            :class_name => :'refinery/contest/movie',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/contest/movies(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Movies)
      end
    end
  end
end
