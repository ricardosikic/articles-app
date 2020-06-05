module Mutations
    class DeleteUser < BaseMutation
        argument :id, ID, required: true

        field :user, Types::UserType, null: true

        def resolve(id: nil)
            #context user -> attrib
            user = context[:current_user]
            return Errors unless user
            
            userId = User.find_by(id: id)
            userId.destroy()
        end
    end
end
