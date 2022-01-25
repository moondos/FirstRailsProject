json.array! @notifications do |notification|
    # json.recipient notification.recipient
    json.actor notification.actor.email
    json.action notification.action
    json.notifiable do  
        # notification.notifiable
        json.type notification.notifiable_type
    end
    json.url post_path(notification.notifiable)
end   