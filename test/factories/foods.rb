# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    name "MyString"
    deadline "2014-02-02"

    factory :food_example do
      sequence(:name) {|n| I18n.t("factory.food.name_#{n}") }
    end
  end
end
