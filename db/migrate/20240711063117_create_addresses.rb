class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.timestamps
    end
  end
end
| postcode               | string | null: false |
| prefecture_id               | integer | null: false |
| city               | string | null: false |
| block               | string | null: false |
| building               | string |  |
| phone_number               | string | null: false |
| order               | references | null: false, foreign_key: true |
