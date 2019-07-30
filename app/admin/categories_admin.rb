Trestle.resource(:categories) do
  menu do
    group :product do
      item :categories, icon: "fa fa-tags", label: "商品類別"
    end
  end

  # scope :all, -> { Category.order("sorting desc") }, default: true

  table do
    column :title, header: "類別名稱"
    column :sorting, header: "排序"
    actions
  end

  form dialog: true do |type|
    text_field :title, label: "類別名稱"
    text_field :sorting, label: "排序"
  end
end
