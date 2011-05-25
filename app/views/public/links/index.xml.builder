xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title bin.title
    xml.description "A bin from http://this.isby.us/"
    xml.link public_bin_links_url(bin.public_hash)

    for link in links
      xml.item do
        xml.title link.display_title
        xml.description link.location
        xml.pubDate link.created_at.to_s(:rfc822)
        xml.link link.location
        xml.guid  public_bin_links_url(bin.public_hash)
      end
    end
  end
end
