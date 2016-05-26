class Event < ActiveRecord::Base
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :image_url => self.image_url,
      :community_id => self.community_id,
      :event_category => self.event_category,
      :user_id => self.user_id,
      :start => self.start_time,
      :end => self.end_time,
      :description => self.description,
      :url => Rails.application.routes.url_helpers.event_path(id)
     }
     end

end
