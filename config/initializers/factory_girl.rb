FactoryGirl.find_definitions
FactoryGirl.define do
  factory :fridge_example, parent: :fridge do
    name I18n.t('factory.fridge.name')

    after(:create) do |fridge|
      create(:food_example, fridge_id: fridge.id, deadline: 1.day.ago)
      create(:food_example, fridge_id: fridge.id, deadline: Date.today)
      create(:food_example, fridge_id: fridge.id, deadline: 1.week.since)
    end
  end

  factory :food_example, parent: :food do
    sequence(:name) {|n| I18n.t("factory.food.name_#{n}") }
  end
end
