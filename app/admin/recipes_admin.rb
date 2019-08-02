Trestle.resource(:recipes) do
  menu do
    group :recipe do
      item :recipes, label: "食譜", icon: "fa fa-star", priority: :first
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :title, header: "標題"
    column :publish, align: :center, link: false, header: "發佈" do |image|      
      if image.status then 
        link_to(status_tag(icon("fa fa-check"), :success) , admin.path(:cancel_status, id: image.id), method: :post, class: "action-btn")
      else 
        link_to(status_tag('none', :danger) , admin.path(:pub_status, id: image.id), method: :post, class: "action-btn")
      end
    end
    column :sorting, header: "排序", align: :center
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |recipe|
    tab "basic", label: "基本資訊" do
      text_field :title
      text_field :sorting
      text_area :desc

      select :tag_ids, Tag.all, { label: "標籤" }, { multiple: true, data: { tags: true } }

      form_group :image, label: "食譜縮圖", help: "圖片尺寸 1920x1080px" do
          concat content_tag(:div, nil, class: "previewimg", id: "thumbpreview"){ 
            concat image_tag(recipe.image.url, class: "thumbimg") if recipe.image.url
          }
          raw_file_field :image, class: "thumbimg"
      end

      form_group :publish, label: "發佈食譜" do
        content_tag :fieldset, :class => "btn-group radio" do
          if recipe.publish == true
            concat content_tag(:input,'', type: "radio", value: true, name: 'recipe[publish]', id: "product_publish_0", checked: true)
            concat content_tag(:label,"是", for: 'product_publish_0', class: 'yes')
            concat content_tag(:input,'', type: "radio", value: false, name: 'recipe[publish]', id: "product_publish_1")
            concat content_tag(:label,"否", for: 'product_publish_1', class: 'no')
          else
            concat content_tag(:input,'', type: "radio", value: true, name: 'recipe[publish]', id: "product_publish_0")
            concat content_tag(:label,"是", for: 'product_publish_0', class: 'yes')
            concat content_tag(:input,'', type: "radio", value: false, name: 'recipe[publish]', id: "product_publish_1", checked: true)
            concat content_tag(:label,"否", for: 'product_publish_1', class: 'no')
          end
        end
      end
    end #end tab

    tab "ingredient", badge: recipe.ingredients.count, label: "食材" do
      if recipe.id?
        concat link_to "新增食材", trestle.new_ingredients_admin_path, class: "btn btn-primary", data:{ "behavior": "dialog"}
        
        table IngredientsAdmin.table, collection: recipe.ingredients
      else
        concat content_tag :p, '儲存食譜後可新增食材', class: "text-danger"
      end
      # fields_for :ingredients, title: "食材" do |ingredient|
      #   row do
      #     col(xs: 3) { ingredient.text_field :title, label: "食材名稱" }
      #     col(xs: 3) { ingredient.text_field :quantity, label: "數量" }
      #     col(xs: 6) { concat content_tag :p, "刪除食材" }
      #   end
      # end
    end #end tab

    tab "practice", label: "作法" do
      editor     :practice, label: "作法", height: 600
    end #end tab
  end

  controller do 
    def pub_status
      missile = admin.find_instance(params)
      missile.update("publish" => true);
      flash[:message] = flash_message("publish.success", title: "#{missile.title} 已發佈", message: "The %{lowercase_model_name} was successfully updated.")  
      redirect_to admin.path(:index, id: missile)
    end

    def cancel_status
      missile = admin.find_instance(params)
      missile.update("publish" => false)
      flash[:error] = flash_message("publish.cancel", title: "#{missile.title} 已取消發佈", message: "The %{lowercase_model_name} was successfully updated.")  
      redirect_to admin.path(:index, id: missile)
    end
  end

  routes do
    post :pub_status, on: :member
    post :cancel_status, on: :member
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:recipe).permit(:name, ...)
  # end
end
