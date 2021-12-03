module TasksHelper
  def sort_order(column, importance, hash_param = {})
   css_class = column == sort_column ? "current #{sort_direction}" : nil
   direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
   link_to importance, { sort: column, direction: direction }.merge(hash_param), class: "sort_header #{css_class}"
  end
end
