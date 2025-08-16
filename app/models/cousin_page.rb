class CousinPage < Sitepress::Model
  collection glob: "cousins/*.html*"
  data :name, :parents, :children, :news_brief
end
