class Tweet < ApplicationRecord
  validates :content, length: { minimum:1,maximum:255}
end
