module HomeHelper
  def products_per_page(items)
    content_tag :li do
      link_to "#{items} Per Page",
              root_path(category: params[:category], per_page: items),
              class: "dropdown-item"
    end
  end
end
