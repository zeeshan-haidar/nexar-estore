class RenameS3UrlToImageInProductImages < ActiveRecord::Migration[7.0]
  def change
    rename_column :product_images, :s3_url, :image
  end
end
