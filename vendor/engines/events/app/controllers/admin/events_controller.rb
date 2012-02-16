class Admin::EventsController < Admin::BaseController

    crudify :event, :order => "date DESC", 
		    :xhr_paging => true,
		    :sortable => false,
		    :searchable => true

  end

