require 'battle/group'
require 'battle/item'

module Battle
  class Web
    class Admin < Web
      get '/?' do
        haml :'admin/index'
      end

      get '/add' do
        haml :'admin/add'
      end

      post '/add' do
        group = Group.first(':name = ?', params[:group])
        Item.create(name: params[:name], group_id: group.nil? ? nil : group.id)
        redirect url_for(:admin)
      end
    end
  end
end
