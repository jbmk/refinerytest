class FieldtripsController < ApplicationController

  before_filter :find_all_fieldtrips
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @fieldtrip in the line below:
    present(@page)
  end

  def show
    @fieldtrip = Fieldtrip.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @fieldtrip in the line below:
    present(@page)
  end

protected

  def find_all_fieldtrips
    @fieldtrips = Fieldtrip.order('Date DESC')
  end

  def find_page
    @page = Page.where(:link_url => "/fieldtrips").first
  end

end
