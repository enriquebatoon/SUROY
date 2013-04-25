ActiveAdmin.register Member do
  index do
    selectable_column
  	column :id
  	column :username
  	column :email
  	column :firstname
  	column :lastname
  	column :user_type
  	column :created_at
  	column :updated_at
    default_actions
  end
  config.per_page = 10
end
