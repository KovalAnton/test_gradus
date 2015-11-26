module OrdersHelper
  def render_map(order)
    "<script src='https://maps.googleapis.com/maps/api/js'></script>".html_safe
  end

end
