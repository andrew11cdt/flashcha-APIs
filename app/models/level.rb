class Level < ApplicationRecord
  has_many :sub_lvls, class_name: "Level", foreign_key: "parent_lvl_id"
  belongs_to :parent_lvl, class_name: "Level", optional: true
end
