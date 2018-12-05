class AddPublicNoticeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :public_notice, :boolean
  end
end
