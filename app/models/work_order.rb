require 'push_notifications/notify'

class WorkOrder < ApplicationRecord
    belongs_to :user, optional: true 
    # , foreign_key: "user_id"
    validates :title, length: {minimum: 1, maximum: 40}, allow_blank: false
    validates :content, length: {minimum: 1}, allow_blank: false
    validates :address, length: {minimum: 1, maximum: 100}, allow_blank: false
    validates :work_type, length: {minimum: 1, maximum: 30}, allow_blank: false
    validates :appointment_time, length: {minimum: 10, maximum: 30}, allow_blank: false

    after_save :send_work_order_assigned_notification, if: :saved_change_to_user_id?, unless: :user_id_changed_to_zero?

    def user_id_changed_to_zero?
        self.user_id == 0
    end
   

    def send_work_order_assigned_notification
        if self.user_id != 0
            puts "SENDING PUSH NOTIFICATION"
            
            Push::Notify.new_work_order(self)
        end
    end

end
