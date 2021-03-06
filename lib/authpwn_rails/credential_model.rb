require 'active_support'

# :nodoc: namespace
module Authpwn

# Included by the model class that roots various credentials.
#
# Parts of the codebase assume the model will be named Credential.
module CredentialModel
  extend ActiveSupport::Concern

  included do
    # The user whose token this is.
    belongs_to :user, inverse_of: :credentials
    validates :user, presence: true

    # Name that can be used to find the token.
    validates :name, length: { in: 1..128, allow_nil: true },
                     uniqueness: { scope: [:type], allow_nil: true }

    # Secret information associated with the token.
    validates :key, length: { in: 1..2.kilobytes, allow_nil: true }
  end

  # Class methods on models that include Authpwn::CredentialModel.
  module ClassMethods

  end  # module Authpwn::FacebookTokenModel::ClassMethods

end  # namespace Authpwn::FacebookTokenModel

end  # namespace Authpwn
