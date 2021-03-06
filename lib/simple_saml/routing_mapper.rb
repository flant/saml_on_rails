module SimpleSaml
  module RoutingMapper

    def saml_authorization(name, params={})
      resource name, params.merge(only: :index, path: :saml) do
        collection do
          get :sso
          post :acs
          post :sls
          get :metadata
          get :logout
          get 'fakelogin/:id', action: 'fakelogin'
        end
      end
    end

  end
end

if defined? ActionDispatch::Routing::Mapper
  ActionDispatch::Routing::Mapper.class_eval do
    include SimpleSaml::RoutingMapper
  end
end
