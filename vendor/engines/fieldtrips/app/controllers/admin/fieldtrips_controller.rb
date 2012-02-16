class Admin::FieldtripsController < Admin::BaseController

    crudify :fieldtrip,
            :title_attribute => 'Name',
	    :xhr_paging => true,
	    :order => "Date DESC",
	    :sortable => false,
	    :searchable => true

end

