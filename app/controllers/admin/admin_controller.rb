class Admin::AdminController < Admin::BaseController
    
    def index
        @tests = TestPayer.page(params[:page]).per_page(10)
    end

end
