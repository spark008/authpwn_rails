# :nodoc: namespace
module AuthpwnRails


class FacebookMigrationGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def create_session_model
    template 'facebook_token.rb',
             File.join('app/models', class_path, 'facebook_token.rb')
    template '002_create_facebook_tokens.rb',
        File.join('db/migrations', '20100725000002_create_facebook_tokens.rb')
    template 'facebook_tokens.yml', File.join('test/fixtures', 'facebook_tokens.yml')
  end
end  # class AuthpwnRails::UserMigrationGenerator

end  # namespace AuthpwnRails
