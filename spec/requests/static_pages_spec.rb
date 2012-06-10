require 'spec_helper'


# 把名稱更改為 Static Pages
describe "Static Pages" do
  # # 宣告base_title為基本的標題
  # let(:base_title) { "Sticker Sample App" }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end


	# 改成 Home Page
  describe "Home Page" do
    before { visit root_path }
    let(:heading)    { 'Sticker Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }

  	# # ““內容可以改成自己的描述。
   #  it "should have the h1 'Sticker Sample App'" do
   #    # 參訪首頁，要有'Sticker App'字串
   #    visit root_path
   #    page.should have_selector('h1', text: 'Sticker Sample App')
   #  end

   #  it "should have the base title" do
   #    visit root_path
   #    page.should have_selector('title', text: "Sticker Sample App")
   #  end

   #  it "should not have a custom page title" do
   #    visit root_path
   #    page.should_not have_selector('title', text: '| Home')
   #  end

  end

  # 新增Help的規則，Help page要有'Help'字串
  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  # 手動新增About頁面，之後要在config/routes.rb新增about
  # 之後在app/controllers/static_pages_controller.rb新增about
  # 並在/static_pages目錄下新增about頁面
  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('Sticker Sample App')
  end
end
