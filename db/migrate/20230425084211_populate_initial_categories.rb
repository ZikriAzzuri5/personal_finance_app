class PopulateInitialCategories < ActiveRecord::Migration[7.0]
  def data
    User.all.each do |user|
      user.create_initial_categories!
    end
  end
end
