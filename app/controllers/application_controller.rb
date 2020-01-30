class ApplicationController < ActionController::API
    def pagination_dict(object)
        {
            current_page: object.current_page,
            next_page: object.next_page,
            prev_page: object.prev_page,
            total_pages: object.total_pages,
            total_count: object.total_count
        }
    end
    def render_paging_json(data, page, per)
        meta = {}
        if page && per
          data = data.page(page).per(per)
          meta = pagination_dict(data)
        end
        render json: { 
            data: data, 
            meta: pagination_dict(data)
            }
    end
    def delete_all data
        data.all.to_a.each do |item|
        item.destroy
        end
        render json: data
    end
end
