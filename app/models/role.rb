class Role < ApplicationRecord
  USER = 'user'
  ADMIN = 'admin'

 def self.all
    [['Utente', USER], ['Amministratore', ADMIN]]
 end

end
