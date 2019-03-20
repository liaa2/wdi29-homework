class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.text    :company_name
      t.integer :founded
      t.text    :hq
      t.text    :ceo
      t.text    :website
      t.text    :slogan
      t.text    :logo_url
    end
  end
end
