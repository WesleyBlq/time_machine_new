module ApplicationHelper
    def paginate(collection, params= {})
        will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
    end
end
module RemoteLinkPaginationHelper
    class LinkRenderer < WillPaginate::ActionView::LinkRenderer
        def link(text, target, attributes = {})
        attributes['data-remote'] = true
        # BootstrapPagination::Rails
        super
        end
    end
end


