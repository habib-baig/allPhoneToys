class Admin < ApplicationRecord
  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end
end
