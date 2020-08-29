require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe '교수항목은 올바른가?' do
     subject{
       describe_class.new(
         name: "이동규",
         major: "컴퓨터공학과",
         image_url: "test.jpg"
       )
     }

     it '이름이 존재해야 한다!!' do
       subject.name = nil
       expect(subject).to_not be_valid
     end

     it '전공이 존재해야 한다!!' do
       subject.major=nil
       expect(subject).to_not be_valid
     end

     it '이미지는 존재하지 않아도 된다' do
       subject.image_url = nil
       expect(subject).to be_valid
     end
  end
end
