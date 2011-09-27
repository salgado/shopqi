# encoding: utf-8

unless OAuth2::Model::Client.exists?(name: 'themes')
  redirect_uri = "http://themes.#{Setting.host}#{':4000' if development?}/callback"
  client = OAuth2::Model::Client.create name: 'themes', redirect_uri: redirect_uri # 注册主题Client，用于商店切换主题操作
  OAuth2::Model::ConsumerClient.create name: 'themes', client_id: client.client_id, client_secret: client.client_secret
end
