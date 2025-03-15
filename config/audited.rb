require "audited"

Audited::Railtie.initializers.each(&:run)

Audited.current_user_method = :authenticated_user
