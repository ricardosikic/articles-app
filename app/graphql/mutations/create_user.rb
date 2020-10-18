module Mutations
    class CreateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end
  
      argument :name, String, required: true
      argument :role, Int, required: true
      argument :auth_provider, AuthProviderSignupData, required: false
  
      type Types::UserType

      field :user, Types::UserType, null: false
  
      def resolve(name: nil, auth_provider: nil, role: nil)
        user = User.create!(
          name: name,
          role: role,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
        )

        return {user: user}
      end
    end
end
  