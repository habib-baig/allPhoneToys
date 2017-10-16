class Pickup < ApplicationRecord
    enum pickup_location: { College_Main: 1 , Cherry_Hollows: 2 , Gardens: 3 , Scandia: 4 }
end
