class AddHasVideoToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :hasVideo, :boolean
  end
end
