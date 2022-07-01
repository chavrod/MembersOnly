class Post < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user

  def unedited?
    created_at == updated_at
  end

  def unedited_history
    if created_at > 4.days.ago
      time_ago_in_words(created_at) + ' ago'
    else
      created_at.strftime('%b %-d %Y')
    end
  end

  def edited_history
    if updated_at > 4.days.ago
      time_ago_in_words(updated_at) + ' ago'
    else
      updated_at.strftime('%b %-d %Y')
    end
  end
end
