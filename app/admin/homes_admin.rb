Trestle.resource(:homes) do
  menu do
    item :homes, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :image, header: false, class: "col-thumb w40" do |img|
      admin_link_to(image_tag(img.image.url, class: "img-responsive"), img) if img.image?
    end
    column :desc, header: "圖片描述", class: "col-desc w40"
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
  form do |home|
    form_group :image, label: "圖片", help: "圖片尺寸 1920x1080px" do
        concat content_tag(:div, nil, class: "previewimg", id: "thumbpreview"){ 
          concat image_tag(home.image.url, class: "thumbimg") if home.image.url
        }
        raw_file_field :image
    end

    text_area :desc, label: "圖片描述"
    text_field :sorting, label: "排序"

    row do
      col(xs: 6) { datetime_field :updated_at }
      col(xs: 6) { datetime_field :created_at }
    end
  end

  controller do 
    def pub_status
      missile = admin.find_instance(params)
      missile.update("publish" => true);
      flash[:message] = flash_message("publish.success", title: "已發佈", message: "The %{lowercase_model_name} was successfully updated.")  
      redirect_to admin.path(:index, id: missile)
    end

    def cancel_status
      missile = admin.find_instance(params)
      missile.update("publish" => false)
      flash[:error] = flash_message("publish.cancel", title: "已取消發佈", message: "The %{lowercase_model_name} was successfully updated.")  
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
  #   params.require(:home).permit(:name, ...)
  # end
end
