class History < ApplicationRecord
    has_many :history_items, dependent: destroy
    belongs_to :user
end
