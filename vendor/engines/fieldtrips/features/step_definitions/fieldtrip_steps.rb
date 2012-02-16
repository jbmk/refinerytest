Given /^I have no fieldtrips$/ do
  Fieldtrip.delete_all
end

Given /^I (only )?have fieldtrips titled "?([^\"]*)"?$/ do |only, titles|
  Fieldtrip.delete_all if only
  titles.split(', ').each do |title|
    Fieldtrip.create(:Name => title)
  end
end

Then /^I should have ([0-9]+) fieldtrips?$/ do |count|
  Fieldtrip.count.should == count.to_i
end
