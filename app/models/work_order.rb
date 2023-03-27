class WorkOrder < ApplicationRecord
    belongs_to :user
    # , foreign_key: "user_id"
    validates :title, length: {minimum: 1, maximum: 40}, allow_blank: false
    validates :content, length: {minimum: 1}, allow_blank: false
    validates :work_type, length: {minimum: 1, maximum: 30}, allow_blank: false
    validates :appointment_time, length: {minimum: 10, maximum: 30}, allow_blank: false

end
