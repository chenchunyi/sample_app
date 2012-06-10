require 'spec_helper'

# 把名稱更改為 Static Pages
describe "Static Pages" do
	# 改成 Home Page
  describe "Home Page" do
  	# ““內容可以改成自己的描述。
    it "should have the h1 'Sample App'" do
      # 參訪首頁，要有'Sticker App'字串
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sticker App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Sticker Sample App | Home")
    end


  end

  # 新增Help的規則，Help page要有'Help'字串
  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Sticker Sample App | Help")
    end
  end

  # 手動新增About頁面，之後要在config/routes.rb新增about
  # 之後在app/controllers/static_pages_controller.rb新增about
  # 並在/static_pages目錄下新增about頁面
  describe "About page" do

    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Sticker Sample App | About Us")
    end

  end

end
