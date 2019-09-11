require 'api_version_constraint'

Rails.application.routes.draw do

  scope module: 'api', default: { format: :json }, constraints: { subdomain: 'api' } do
    scope module: 'v1', constraints: ApiVersionConstraint.new(version: 1, default: true) do
      resources :recipes
    end
  end
end
