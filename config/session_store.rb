Rails.application.config.session_store :cookie_store, key: "_planning_my_meal_session", expire_after: 10.days, secure: !Rails.env.development?
