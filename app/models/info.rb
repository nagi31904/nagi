class Info < ActiveRecord::Base
  def display_hour

    created_at.to_s.split(" ").first
  end
end
