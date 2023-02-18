module HomeHelper
  def items_per_page(items)
    link_to "#{items} Per Page",
            root_path(category: params[:category], per_page: items),
            class: "dropdown-item"
  end
end
