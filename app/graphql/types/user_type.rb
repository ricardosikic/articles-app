module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :lastname, String, null: false
    field :email, String, null: false
    field :city, String, null: false
  end
end
