class Pin < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { thumb: "236x", large: "750x550>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
