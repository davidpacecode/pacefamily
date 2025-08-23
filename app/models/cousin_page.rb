class CousinPage < Sitepress::Model
  collection glob: "cousins/*.html*"
  data :first_name, :last_name, :url, :parents, :spouse, :children, :news_brief
end
