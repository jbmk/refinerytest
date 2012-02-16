if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'fieldtrips').blank?
      user.plugins.create(:name => 'fieldtrips',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Fieldtrips',
    :link_url => '/fieldtrips',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/fieldtrips(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end