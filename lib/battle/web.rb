require File.join(File.dirname(__FILE__), '..', 'battle')

require 'haml'
require 'sinatra/base'

require 'battle/item'

# Helpers
require 'sinatra/content'
require 'sinatra/url'

module Battle
  class Web < Sinatra::Base
    set :root, Battle.root
    set :haml, escape_html: true, format: :html5

    get '/?' do
      @first  = Item.random
      @second = Item.random(@first) if @first
      haml :index
    end

    get '/popular' do
      @items = Item.popular
      haml :popular
    end

    get '/hated' do
      @items = Item.hated
      haml :hated
    end

    post '/vote' do
      up = Item.get(id: params[:up_id]) or raise(Sinatra::NotFound)
      up.upvote
      if params[:down_id]
        down = Item.get(id: params[:down_id]) or raise(Sinatra::NotFound)
        down.downvote
      end
      redirect '/'
    end
  end
end
