# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fridge do
    name "MyString"
    user nil

    factory :fridge_example do
      name I18n.t('factory.fridge.name')

      after(:create) do |fridge|
        create(:food_example, fridge_id: fridge.id, deadline: 1.day.ago)
        create(:food_example, fridge_id: fridge.id, deadline: Date.today)
        create(:food_example, fridge_id: fridge.id, deadline: 1.week.since)
      end
    end
  end
end
