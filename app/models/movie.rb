class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :covers, dependent: :destroy
  accepts_nested_attributes_for :covers, allow_destroy: true
  def as_json(_opts = {})
    {
      id: id,
      title: title,
      description: description,
      errors: errors,
      cover_photos: covers.map do |cover|
        {
          url: cover.photo.url,
          name: cover.photo_file_name,
          id: cover.id
        }
      end
    }
  end
end
