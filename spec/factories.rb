FactoryGirl.define do

  factory :user do
    sequence(:username)		{ |n| "cool hand user #{n}"}
    sequence(:email)		{ |n| "user-#{n}@gmail.com"}

    password              "123"
    password_confirmation "123"

    phone_number	"1234567890"
    carrier		"Bell"
  end

end

	
	# validates_presence_of :password, on: :create
	# validates_confirmation_of :password

	# validates_presence_of :phone_number
	# validates :phone_number, length: {minimum: 10}, numericality: { only_integer: true }

	# validates_presence_of :carrier

 #  create_table "users", force: true do |t|
 #    t.string   "username",         null: false
 #    t.string   "email"
 #    t.string   "crypted_password"
 #    t.string   "salt"
 #    t.datetime "created_at"
 #    t.datetime "updated_at"
 #    t.integer  "phone_number"
 #    t.string   "carrier"
 #    t.float    "lat"