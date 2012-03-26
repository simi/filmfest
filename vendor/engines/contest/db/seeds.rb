if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-contest').blank?
      user.plugins.create(:name => 'refinerycms-contest',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
