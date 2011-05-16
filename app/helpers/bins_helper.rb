module BinsHelper
  def class_for_time_selection(time)
    time == ( params[:time] || '24') ? 'current_view' : ''
  end
end
