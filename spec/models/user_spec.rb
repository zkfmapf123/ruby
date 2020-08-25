require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe '이동규의 회원은 올바른가?' do

    subject {
      described_class.new(
        name: "이동규",
        email: "zkfmapf123@naver.com",
        major: "컴퓨터공학과",
        password: "123",
        password_confirmation: "123" 
      )
    }

    it '이름값이 있어야한다!!' do
      subject.name=nil
      expect(subject).to_not be_valid
    end

    it '이메일이 있어야한다.!!' do
      subject.email=nil
      expect(subject).to_not be_valid
    end

    it '전공이 있어야한다.!' do
      subject.major=nil
      expect(subject).to_not be_valid
    end 
    
    it '모든값이 유효한가?' do
      expect(subject).to be_valid  
    end
    
    it '이동규의 신고는 아직 0이다' do
    expect(subject.alert).to eql 0
    end

    it '이동규의 비밀번호가 123이 맞는가?' do
    expect(!!subject.authenticate("123")).to eql true
    end
  end

  describe '연관이 되있는 항목' do
    
  end
end
