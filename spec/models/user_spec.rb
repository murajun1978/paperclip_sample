require 'spec_helper'

describe ".file_copy" do 
  context "Specify the file name as an argument" do 
    before do
      @user = User.file_copy(user_name: 'test')
    end

    it "return hash" do
      expect(@user.kind_of?(Hash)).to be_true
    end

    it "has name key" do 
      expect(@user.has_key?(:name)).to be_true
    end

    it "has avatar key" do 
      expect(@user.has_key?(:avatar)).to be_true
    end

    it "name is 'test'" do 
      expect(@user[:name]).to eq 'test'
    end

    it "content_type is 'text/html'" do 
      expect(@user[:avatar].content_type).to eq 'text/html'
    end

    it "file's name is '404.html'" do 
      expect(@user[:avatar].original_filename).to eq '404.html'
    end
  end
end
