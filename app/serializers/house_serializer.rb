class HouseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :house_description, :location, :availability, :price, :discount, :image, :user_id

  def image
    if object.image.attached?
      rails_blob_url(object.image)
    
    end
  end
end
