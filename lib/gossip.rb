require "csv"
require "pry"

class Gossip
  # variable d'instance
  attr_reader :author, :content

  # constructeur
  def initialize(author, content)
    @content = content
    @author = author
  end

  # fonction sauvegarder sous csv
  def save
    file = CSV.open(File.expand_path("../../db/gossip.csv", __FILE__), "ab") do |csv|
      csv << [@author, @content]
    end
    file.close
  end

  # fonction qui retourne les lignes dans un fichier csv
  def self.all_tableau_csv
    line = CSV.read(File.expand_path("./../../db/gossip.csv", __FILE__))
    return line
  end

  # fonction qui retourne la liste des tableaux d'objets
  def self.all
    all_gossips = []
    all_gossips_csv = Gossip.all_tableau_csv
    for indexgossip in 0...all_gossips_csv.size
      all_gossips << Gossip.new(all_gossips_csv[indexgossip][0], all_gossips_csv[indexgossip][1])
    end
    return all_gossips
  end

  # fonction qui cherche un gossip à partie de son index
  def self.find(id_gossip)
    return Gossip.all[id_gossip - 1]
  end

  # fonction qui met à jour un gossip à partie de son index
  def self.update(id)
  end
end
