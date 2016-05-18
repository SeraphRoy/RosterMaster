require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user has the right privilege" do
    user = User.new
    ability = Ability.new(user)
    it {expect(ability.can? :read, :all).to eq(true)}
    it {expect(ability.can? :crud, Course).to eq(false)}
    it {expect(ability.can? :crud, Student).to eq(false)}
  end
  describe "instructor has the right privilege" do
    user = User.new
    user.add_role "instructor"
    ability = Ability.new(user)
    it {expect(ability.can? :read, :all).to eq(true)}
    it {expect(ability.can? :crud, Course).to eq(true)}
    it {expect(ability.can? :crud, Student).to eq(true)}
  end
end
