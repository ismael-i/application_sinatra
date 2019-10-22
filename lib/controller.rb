require "bundler"
Bundler.require
require_relative "gossip"

class ApplicationController < Sinatra::Base
  # à partir de l' url '/', affiche le contenu de index.erb qui est dans views
  get "/" do
    erb :index, locals: { gossips: Gossip.all }
  end

  # à partir de l' url '/gossips/new', affiche le contenu de new_gossip.erb qui est dans views
  get "/gossips/new" do
    erb :new_gossip
  end

  # à partir d'un resultat d'un formulaire, il y a redirection vers le contenu de new_gossip.erb qui est dans views
  post "/gossips/new/" do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "ça a marché"
    redirect "/"
  end

  # à partir de l'url '/gossip/:id', affiche le contenu de show.erb qui est dans views et donne des parametres au vue show
  get "/gossips/:id" do
    erb :show, locals: { id: params["id"], gossip: Gossip.find(params["id"].to_i) }
  end

  # run! if app_file == $0
end
