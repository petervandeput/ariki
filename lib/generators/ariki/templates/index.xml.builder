# app/views/sitemaps/index.xml.builder

xml.instruct! :xml, version: '1.0'
xml.tag! 'sitemapindex', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.tag! 'url' do
    xml.tag! 'loc', root_url
  end

  @posts.each do |post|
    xml.tag! 'url' do
      xml.tag! 'loc', root_url + '/'+ post.slug
      xml.changefreq 'daily'
      xml.priority 0.8
      xml.lastmod post.updated_at.strftime("%F")
    end
  end

end