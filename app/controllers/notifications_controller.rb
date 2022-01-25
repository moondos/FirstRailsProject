class NotificationsController < ApplicationController
    def index
        @notifications = Notification.where(recipient: User.find(session[:user_id])).unread
    end

    def mark_as_read
        @notifications = Notification.where(recipient: User.find(session[:user_id])).unread
        @notifications.update_all(read_at: Time.zone.now)
        render json: {success: true}
    end

end
