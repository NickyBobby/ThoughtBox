class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true

  scope :alphabetically, -> { order('lower(title) ASC') }
end
