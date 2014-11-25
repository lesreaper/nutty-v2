ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

csv do
  column :id
  column :email
  column :total
  column("Products") { |o| o.products.collect(&:title).join(", ") } 
  column("Order Date") { |o| o.created_at.strftime("%-m/%-d/%Y %-I:%M%p") }
end


end
