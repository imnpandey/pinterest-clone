class Pin < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_attached_file :image, styles: { thumb: "236x", large: "750x550>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
