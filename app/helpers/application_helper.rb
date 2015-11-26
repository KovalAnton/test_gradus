module ApplicationHelper

  def asset_path
    action =  case params[:action]
              when 'update' then 'edit'
              when 'new' then 'edit'
              else params[:action]
              end
    "#{params[:controller]}/#{action}"
  end
end
