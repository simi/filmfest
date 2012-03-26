module Refinery
  module Contest
    module Admin
      class MoviesController < ::Refinery::AdminController

        crudify :'refinery/contest/movie',
                :title_attribute => 'name', :xhr_paging => true,
                :order => 'approved, position ASC'

      end
    end
  end
end
