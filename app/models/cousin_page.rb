class CousinPage < Sitepress::Model
  collection glob: "cousins/*.html*"
  data :first_name, :last_name, :url, :family, :family_sort_order, :cousin_sort_order, :parents, :spouse, :children, :news_brief
end
