group_attributes = [
  { name: "慢跑", description: "怎麼跑才不傷膝蓋？"},
  { name: "游泳", description: "游池公休日一覽表"},
  { name: "單車", description: "最迷你的小摺"},
  { name: "桌球", description: "拍子哪裡買？"},
  { name: "羽球", description: "揪團往這走"},
  { name: "壁球", description: "台北壁球場 pk 表"},
  { name: "飛鏢", description: "飛鏢大賽"},
  { name: "重訓", description: "深蹲膝蓋不能過腳尖？！"}
]

group_attributes.each do |group_attribute|
  group = Group.find_or_create_by(group_attribute)
  for i in 1..5 do
    group.posts.find_or_create_by(title: "test post #{i}", content: "asdfasdf")
  end
end
