class User < ApplicationRecord

  has_secure_password   # makes 'password' field MANDATORY

end
