FactoryBot.define do
  factory :ingredient do
    title { "MyString" }
    quantity { "MyString" }
    publish { false }
    sorting { 1 }
    recipe_id { 1 }
  end
end
