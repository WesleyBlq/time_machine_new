class Admin::AdminController < Admin::BaseController
    
    def index
        @tests = TestPayer.all.paginate(:page => params[:page], :per_page => 10)
    end

end
