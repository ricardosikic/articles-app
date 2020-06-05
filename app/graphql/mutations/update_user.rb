module Mutations
    class UpdateUser < BaseMutation
        argument :id, ID, required: true
        argument :email, String, required: false
        argument :password, String, required: false
        argument :name, String, required: false
        argument :lastname, String, required: false
        argument :city, String, required: false

        field :user, Types::UserType, null: true

        def resolve(**attributes)
            #context user -> attrib
            user = context[:current_user]
            return Errors unless user
            
            User.update(**attributes)
        end
    end
end
