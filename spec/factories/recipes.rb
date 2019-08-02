FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    desc { "MyText" }
    practice { "MyText" }
    publish { false }
    sorting { 1 }
    image { "MyString" }
  end
end
